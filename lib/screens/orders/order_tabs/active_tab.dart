import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/orders/cancel_order_screen.dart';
import 'package:intl/intl.dart';

import '../../../models/order_model.dart';
import '../order_tracking_screen.dart';

class ActiveTab extends StatefulWidget {
  const ActiveTab({super.key});

  @override
  State<ActiveTab> createState() => _ActiveTabState();
}

class _ActiveTabState extends State<ActiveTab> {
  final _hasActiveOrders = true;

  final List<OrderModel> orders = [
    OrderModel(
      productName: "Strawberry shake",
      productPrice: 20.00,
      productQuantity: 2,
      orderDateTime: DateTime.now(),
      productImage: "assets/images/orders/order1.png",
    ),
    OrderModel(
      productName: "Chicken Burger",
      productPrice: 40.00,
      productQuantity: 4,
      orderDateTime: DateTime.now(),
      productImage: "assets/images/orders/order3.png",
    ),
    OrderModel(
      productName: "Chicken Curry",
      productPrice: 50.00,
      productQuantity: 2,
      orderDateTime: DateTime.now(),
      productImage: "assets/images/orders/order2.png",
    ),
    OrderModel(
      productName: "Strawberry Pie",
      productPrice: 30.00,
      productQuantity: 3,
      orderDateTime: DateTime.now(),
      productImage: "assets/images/orders/order5.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _hasActiveOrders ? activeOrders() : Center(child: noActiveOrders()),
    );
  }

  Widget noActiveOrders() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 140,
          height: 167,
          child: Image.asset("assets/images/general/no_active_orders.png"),
        ),
        SizedBox(height: 41),
        Text(
          "You don't have any active orders at this time.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'LeagueSpartan',
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color(0XFFE95322),
          ),
        ),
      ],
    );
  }

  Widget activeOrders() {
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 71.68,
                height: MediaQuery.sizeOf(context).height * 0.15,
                child: Image.asset(order.productImage),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.productName,
                      style: TextStyle(
                        color: Color(0XFF391713),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'LeagueSpartan',
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      DateFormat('d MMM, hh:mm a').format(order.orderDateTime),
                    ),
                    SizedBox(height: 5),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CancelOrderScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0XFFE95322),
                        foregroundColor: Color(0XFFFFFFFF),
                        fixedSize: Size(120, 36),
                        visualDensity: VisualDensity.comfortable,
                      ),
                      child: const Text(
                        "Cancel Order",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              // Right Column
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "\$${order.productPrice}",
                    style: const TextStyle(
                      color: Color(0XFF391713),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'LeagueSpartan',
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "${order.productQuantity} items",
                    style: TextStyle(color: Color(0XFF391713)),
                  ),
                  SizedBox(height: 5),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => OrderTrackingScreen(
                                orderDate: order.orderDateTime,
                              ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0XFFFFDECF),
                      foregroundColor: Colors.deepOrangeAccent,
                      fixedSize: Size(120, 36),
                      visualDensity: VisualDensity.comfortable,
                    ),
                    child: Text("Track Driver", textAlign: TextAlign.center),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
