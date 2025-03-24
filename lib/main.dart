import 'package:fieldp/pages/donate_screen.dart';
import 'package:fieldp/pages/donation_page.dart';
import 'package:fieldp/pages/donation_sucess.dart';
import 'package:fieldp/pages/login_page.dart';
import 'package:fieldp/pages/signup_screen.dart';
import 'package:fieldp/pages/start_donating.dart';
import 'package:fieldp/pages/start_receiving.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUpScreen(),
        '/donation_page': (context) => DonationsPage(),
        '/start_receiving': (context) => StartReceivingSignUpScreen(),
        '/start_donating': (context) => StartDonatingScreen(),
        '/donate_now': (context) => DonateNowScreen(),
        '/donate': (context) => DonationSuccessScreen(),
      },
    );
  }
}
