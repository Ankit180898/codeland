import 'dart:async';

import 'package:codeland/res/constants.dart';
import 'package:flutter/material.dart';

import '../login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width*0.60,
            height: MediaQuery.of(context).size.height * 0.40,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: 10,
                    spreadRadius: 0,
                    offset: const Offset(0, 4),
                    color: Colors.black.withOpacity(0.5))
              ],
              color: textColor,
              borderRadius: BorderRadius.circular(63),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/tree_logo.png"),
                Image.asset("assets/name.png"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
