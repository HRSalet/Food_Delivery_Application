import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OrderDeliveredScreen extends StatefulWidget {
  const OrderDeliveredScreen({super.key});

  @override
  State<OrderDeliveredScreen> createState() => _OrderDeliveredScreenState();
}

class _OrderDeliveredScreenState extends State<OrderDeliveredScreen> {
  int _currentRating = 0;
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
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            children: [
              Lottie.asset(
                "assets/animation/order_cancel_success.json",
                repeat: false,
                animate: true,
              ),
              SizedBox(height: 25),
              Text(
                "Order Delivered",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 35,
                  color: Color(0XFF391713),
                ),
              ),
              SizedBox(height: 15),
              Text(
                "Your order has been successfully delivered, enjoy it!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16,
                  color: Color(0XFF391713),
                ),
              ),
              SizedBox(height: 35),
              Text(
                "Rate our delivery service",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16,
                  color: Color(0XFF391713),
                ),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return IconButton(
                    onPressed: () {
                      setState(() {
                        _currentRating = index + 1;
                      });
                    },
                    icon: Icon(
                      index < _currentRating
                          ? Icons.star_rounded
                          : Icons.star_border_rounded,
                      size: 33,
                      color: Colors.green,
                    ),
                  );
                }),
              ),
              SizedBox(height: 50),
              Text(
                "If you have any question, please reach out directly to our customer support.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16,
                  color: Color(0XFF391713),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
