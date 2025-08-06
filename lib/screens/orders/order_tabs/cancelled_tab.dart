import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../../models/order_model.dart';

class CancelledTab extends StatefulWidget {
  const CancelledTab({super.key});

  @override
  State<CancelledTab> createState() => _CancelledTabState();
}

class _CancelledTabState extends State<CancelledTab> {
  final List<OrderModel> orders = [
    OrderModel(
      productName: "Sushi Wave",
      productPrice: 103.00,
      productQuantity: 3,
      orderDateTime: DateTime.now(),
      productImage: "assets/images/best_seller/bs1.png",
    ),
    OrderModel(
      productName: "Fruit and Berry Tea",
      productPrice: 15.00,
      productQuantity: 2,
      orderDateTime: DateTime.now(),
      productImage: "assets/images/orders/order6.png",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
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
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                          FontAwesomeIcons.circleXmark,
                                          color: Colors.red.shade300,
                                          size: 15,
                                        ),
                                        SizedBox(width: 7),
                                        Text(
                                          "Order cancelled",
                                          style: TextStyle(
                                            color: Colors.red.shade300,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "\$${order.productPrice}",
                                      style: const TextStyle(
                                        color: Colors.orange,
                                        fontSize: 18,
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
    );
  }
}
