import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_delivery_app/screens/orders/order_history_screen.dart';
import 'package:food_delivery_app/screens/orders/review_order_screen.dart';
import 'package:intl/intl.dart';

import '../../../models/order_model.dart';

class CompletedTab extends StatefulWidget {
  const CompletedTab({super.key});

  @override
  State<CompletedTab> createState() => _CompletedTabState();
}

class _CompletedTabState extends State<CompletedTab> {
  final List<OrderModel> orders = [
    OrderModel(
      productName: "Chicken Curry",
      productPrice: 50.00,
      productQuantity: 2,
      orderDateTime: DateTime.now(),
      productImage: "assets/images/orders/order2.png",
    ),
    OrderModel(
      productName: "Bean and Vegetable Burger",
      productPrice: 50.00,
      productQuantity: 2,
      orderDateTime: DateTime.now(),
      productImage: "assets/images/orders/order3.png",
    ),
    OrderModel(
      productName: "Coffee Latte",
      productPrice: 8.00,
      productQuantity: 1,
      orderDateTime: DateTime.now(),
      productImage: "assets/images/orders/order4.png",
    ),
    OrderModel(
      productName: "Strawberry Cheesecake",
      productPrice: 22.00,
      productQuantity: 2,
      orderDateTime: DateTime.now(),
      productImage: "assets/images/orders/order5.png",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 10.0,
                      ),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    // Left Column
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            order.productName,
                                            style: TextStyle(
                                              color: Color(0XFF391713),
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'LeagueSpartan',
                                            ),
                                            maxLines: 2,
                                          ),
                                          //SizedBox(height: 5),
                                          Text(
                                            DateFormat(
                                              'd MMM, hh:mm a',
                                            ).format(order.orderDateTime),
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                FontAwesomeIcons.circleCheck,
                                                color: Colors.orange.shade300,
                                                size: 15,
                                              ),
                                              SizedBox(width: 7),
                                              Text(
                                                "Order Delivered",
                                                style: TextStyle(
                                                  color: Colors.orange.shade300,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    // Right Column
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            "\$${order.productPrice}",
                                            style: const TextStyle(
                                              color: Colors.deepOrange,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'LeagueSpartan',
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            "${order.productQuantity} items",
                                            style: TextStyle(
                                              color: Color(0XFF391713),
                                            ),
                                          ),
                                          SizedBox(height: 7),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        var selectedOrder = orders[index];
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (context) => ReviewOrderScreen(
                                                  productName:
                                                      selectedOrder.productName,
                                                  imagePath:
                                                      selectedOrder
                                                          .productImage,
                                                ),
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0XFFE95322),
                                        foregroundColor: Color(0XFFFFFFFF),
                                        fixedSize: Size(100, 36),
                                        visualDensity:
                                            VisualDensity.comfortable,
                                      ),
                                      child: Text(
                                        "Leave a review",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (context) => OrderHistoryScreen(
                                                  orderDateTime:
                                                      order.orderDateTime,
                                                  orderPrice:
                                                      order.productPrice,
                                                  quantity:
                                                      order.productQuantity,
                                                ),
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0XFFFFDECF),
                                        foregroundColor:
                                            Colors.deepOrangeAccent,
                                        fixedSize: Size(100, 36),
                                        visualDensity:
                                            VisualDensity.comfortable,
                                      ),
                                      child: Text(
                                        "Order Again",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(color: Colors.orange.shade300, thickness: 0.5),
                  ],
                );
              },
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
