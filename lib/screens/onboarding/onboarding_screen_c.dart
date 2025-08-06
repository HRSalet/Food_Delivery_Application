import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/authentication/login_screen.dart';

class OnboardingScreenC extends StatelessWidget {
  const OnboardingScreenC({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/onboarding/onboarding3.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 32.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.delivery_dining_rounded,
                      size: 50,
                      color: Colors.deepOrange,
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Fast Delivery",
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Inter',
                        color: Colors.deepOrange,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      textAlign: TextAlign.center,
                      "Get your cravings satisfied in record time! Our app ensures lightning-fast delivery right to your doorstep. Track your order in real-time and enjoy your delicious meal while it's still hot and fresh.",
                      style: TextStyle(
                        fontFamily: 'LeagueSpartan',
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0XFFE95322),
                        foregroundColor: Color(0XFFFFFFFF),
                        fixedSize: Size(133, 36),
                        visualDensity: VisualDensity.comfortable,
                      ),
                      child: Text(
                        "Get Started",
                        style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'LeagueSpartan',
                        ),
                      ),
                    ),
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
