import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_delivery_app/screens/orders/order_detail_screen.dart';
import 'package:intl/intl.dart';

class OrderHistoryScreen extends StatefulWidget {
  final DateTime orderDateTime;
  final double orderPrice;
  final int quantity;
  const OrderHistoryScreen({
    super.key,
    required this.orderDateTime,
    required this.orderPrice,
    required this.quantity,
  });

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  late int _orderNumber;

  @override
  void initState() {
    super.initState();
    _orderNumber = _generateOrderNo();
  }

  int _generateOrderNo() {
    Random random = Random();
    return 1000000 + random.nextInt(9000000);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF5CB58),
      appBar: AppBar(
        toolbarHeight: 100.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.deepOrange,
          ),
        ),
        backgroundColor: Colors.transparent,
        title: Text(
          "Order History",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 25,
            color: Color(0XFFF8F8F8),
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0XFFF5F5F5),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Column(
            children: [
              SizedBox(height: 40),
              Divider(thickness: 0.5, color: Colors.deepOrange),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Order No. $_orderNumber",
                          style: TextStyle(
                            fontFamily: 'LeagueSpartan',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          DateFormat('d MMM, hh:mm a').format(DateTime.now()),
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
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "\$${widget.orderPrice}",
                          style: TextStyle(
                            fontFamily: 'LeagueSpartan',
                            fontSize: 20,
                            color: Colors.deepOrange,
                          ),
                        ),
                        Text(
                          "${widget.quantity} items",
                          style: TextStyle(fontFamily: 'LeagueSpartan'),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0XFFE95322),
                            foregroundColor: Color(0XFFFFFFFF),
                            fixedSize: Size(90, 30),
                            visualDensity: VisualDensity.comfortable,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => OrderDetailScreen(
                                      orderNo: _orderNumber,
                                      orderDateTime: DateTime.now(),
                                    ),
                              ),
                            );
                          },
                          child: Text("Details", textAlign: TextAlign.center),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
