import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CancelOrderScreen extends StatefulWidget {
  const CancelOrderScreen({super.key});

  @override
  State<CancelOrderScreen> createState() => _CancelOrderScreenState();
}

enum CancelReason {
  technicalIssue,
  tooExpensive,
  incorrectInfo,
  shippingCost,
  noLongerNeed,
  other,
}

class _CancelOrderScreenState extends State<CancelOrderScreen> {
  CancelReason? _reason = CancelReason.technicalIssue;
  final TextEditingController _reasonController = TextEditingController();
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
          "Cancel Order",
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
          padding: EdgeInsets.only(left: 40.0, right: 40.0, top: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Before you cancel, please let us know the reason you are leaving. Every bit of feedback helps!",
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: "LeagueSpartan", fontSize: 14),
              ),
              Divider(thickness: 1, color: Color(0XFFFFD8C7)),
              Column(
                children: [
                  RadioListTile<CancelReason>(
                    title: Text("Technical issue"),
                    value: CancelReason.technicalIssue,
                    groupValue: _reason,
                    onChanged: (CancelReason? value) {
                      setState(() {
                        _reason = value;
                      });
                    },
                    activeColor: Colors.deepOrange,
                  ),
                  Divider(thickness: 1, color: Color(0XFFFFD8C7)),
                  RadioListTile<CancelReason>(
                    title: Text("Too expensive"),
                    value: CancelReason.tooExpensive,
                    groupValue: _reason,
                    onChanged: (CancelReason? value) {
                      setState(() {
                        _reason = value;
                      });
                    },
                    activeColor: Colors.deepOrange,
                  ),
                  Divider(thickness: 1, color: Color(0XFFFFD8C7)),
                  RadioListTile<CancelReason>(
                    title: Text("Incorrect information"),
                    value: CancelReason.incorrectInfo,
                    groupValue: _reason,
                    onChanged: (CancelReason? value) {
                      setState(() {
                        _reason = value;
                      });
                    },
                    activeColor: Colors.deepOrange,
                  ),
                  Divider(thickness: 1, color: Color(0XFFFFD8C7)),
                  RadioListTile<CancelReason>(
                    title: Text("Shipping costs too high"),
                    value: CancelReason.shippingCost,
                    groupValue: _reason,
                    onChanged: (CancelReason? value) {
                      setState(() {
                        _reason = value;
                      });
                    },
                    activeColor: Colors.deepOrange,
                  ),
                  Divider(thickness: 1, color: Color(0XFFFFD8C7)),
                  RadioListTile<CancelReason>(
                    title: Text("No longer need the item"),
                    value: CancelReason.noLongerNeed,
                    groupValue: _reason,
                    onChanged: (CancelReason? value) {
                      setState(() {
                        _reason = value;
                      });
                    },
                    activeColor: Colors.deepOrange,
                  ),
                  Divider(thickness: 1, color: Color(0XFFFFD8C7)),
                  RadioListTile<CancelReason>(
                    title: Text("Other"),
                    value: CancelReason.other,
                    groupValue: _reason,
                    onChanged: (CancelReason? value) {
                      setState(() {
                        _reason = value;
                      });
                    },
                    activeColor: Colors.deepOrange,
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      if (_reason == null &&
                          _reasonController.text.trim().isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Please provide a reason to cancel."),
                          ),
                        );
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OrderCancelSuccessfully(),
                          ),
                        );
                      }
                    },
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
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

class OrderCancelSuccessfully extends StatelessWidget {
  const OrderCancelSuccessfully({super.key});

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
                "Order Cancelled",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 35,
                  color: Color(0XFF391713),
                ),
              ),
              SizedBox(height: 15),
              Text(
                "Your order has been successfully cancelled.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16,
                  color: Color(0XFF391713),
                ),
              ),
              SizedBox(height: 250),
              Text(
                "If you have any question reach directly to our customer support.",
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
