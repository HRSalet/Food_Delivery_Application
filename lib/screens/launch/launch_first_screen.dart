import 'package:flutter/material.dart';

class LaunchFirstScreen extends StatefulWidget {
  const LaunchFirstScreen({super.key});

  @override
  State<LaunchFirstScreen> createState() => _LaunchFirstScreenState();
}

class _LaunchFirstScreenState extends State<LaunchFirstScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushNamed(context, '/onboarding_screen_a');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF5CB58),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 202,
              height: 178.95,
              child: Image.asset('assets/images/logo/app_logo.png'),
            ),
            SizedBox(height: 20),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "YUM",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  TextSpan(
                    text: "QUICK",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
