import 'package:flutter/material.dart';
import 'package:food_delivery_app/providers/address_provider.dart';
import 'package:food_delivery_app/providers/cart_provider.dart';
import 'package:food_delivery_app/screens/launch/launch_first_screen.dart';
import 'package:food_delivery_app/screens/launch/launch_welcome_screen.dart';
import 'package:food_delivery_app/screens/onboarding/onboarding_screen_a.dart';
import 'package:food_delivery_app/screens/onboarding/onboarding_screen_b.dart';
import 'package:food_delivery_app/screens/onboarding/onboarding_screen_c.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AddressProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'YUM QUICK',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
      ),
      initialRoute: '/launch_first',
      routes: {
        '/launch_first': (context) => const LaunchFirstScreen(),
        '/launch_welcome': (context) => const LaunchWelcomeScreen(),
        '/onboarding_screen_a': (context) => const OnboardingScreenA(),
        '/onboarding_screen_b': (context) => const OnboardingScreenB(),
        '/onboarding_screen_c': (context) => const OnboardingScreenC(),
      },
    );
  }
}
