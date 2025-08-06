import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/help/help_center.dart';
import 'package:food_delivery_app/screens/help/support_screen.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF5CB58),
      body: Stack(
        children: [
          Positioned(
            child: Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                color: Color(0XFFF5F5F5),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 30, left: 30, right: 30),
                child: Column(
                  children: [
                    Text(
                      "Whether you have a question about your order, delivery, payments, or anything else, you're in the right place.",
                      style: TextStyle(
                        fontFamily: 'LeagueSpartan',
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Divider(thickness: 0.5, color: Colors.deepOrange.shade200),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SupportScreen(),
                          ),
                        );
                      },
                      child: ListTile(
                        title: Text(
                          "Help with the order",
                          style: TextStyle(
                            fontFamily: 'LeagueSpartan',
                            fontSize: 20,
                          ),
                        ),
                        subtitle: Text(
                          "Support",
                          style: TextStyle(
                            fontFamily: 'LeagueSpartan',
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.deepOrange,
                        ),
                      ),
                    ),
                    Divider(thickness: 0.5, color: Colors.deepOrange.shade200),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HelpCenter()),
                        );
                      },
                      child: ListTile(
                        title: Text(
                          "Help center",
                          style: TextStyle(
                            fontFamily: 'LeagueSpartan',
                            fontSize: 20,
                          ),
                        ),
                        subtitle: Text(
                          "General Information",
                          style: TextStyle(
                            fontFamily: 'LeagueSpartan',
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.deepOrange,
                        ),
                      ),
                    ),
                    Divider(thickness: 0.5, color: Colors.deepOrange.shade200),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
