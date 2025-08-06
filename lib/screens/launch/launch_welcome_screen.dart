import 'package:flutter/material.dart';

class LaunchWelcomeScreen extends StatelessWidget {
  const LaunchWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFE95322),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 202,
              height: 178.95,
              child: Image.asset('assets/images/logo/app_logo_second.png'),
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
                      color: Colors.yellow,
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
            SizedBox(height: 30),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Taste the Moment",
                    style: TextStyle(fontSize: 14, fontFamily: 'LeagueSpartan'),
                  ),
                  TextSpan(
                    text: "\nWhere every bite is a delight",
                    style: TextStyle(fontSize: 14, fontFamily: 'LeagueSpartan'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0XFFF5CB58),
                foregroundColor: Color(0XFFE95322),
                fixedSize: Size(180, 50),
                elevation: 5.0,
                visualDensity: VisualDensity.comfortable,
              ),
              child: Text(
                "Log In",
                style: TextStyle(fontSize: 30, fontFamily: 'LeagueSpartan'),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0XFFFFFFFF),
                foregroundColor: Color(0XFFF5CB58),
                fixedSize: Size(180, 50),
                elevation: 5.0,
                visualDensity: VisualDensity.comfortable,
              ),
              child: Text(
                "Sign Up",
                style: TextStyle(fontSize: 30, fontFamily: 'LeagueSpartan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
