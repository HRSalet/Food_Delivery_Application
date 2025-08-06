import 'package:flutter/material.dart';

class OnboardingScreenB extends StatelessWidget {
  const OnboardingScreenB({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/onboarding/onboarding2.png',
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
                      Icons.payment_rounded,
                      size: 50,
                      color: Colors.deepOrange,
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Easy Payment",
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Inter',
                        color: Colors.deepOrange,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      textAlign: TextAlign.center,
                      "Paying for your orders just got simpler. Our app offers secure and seamless payment options, from credit and debit cards to popular digital wallets.",
                      style: TextStyle(
                        fontFamily: 'LeagueSpartan',
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          '/onboarding_screen_c',
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0XFFE95322),
                        foregroundColor: Color(0XFFFFFFFF),
                        fixedSize: Size(133, 36),
                        visualDensity: VisualDensity.comfortable,
                      ),
                      child: Text(
                        "Next",
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
