import 'dart:async';

import 'package:codeland/res/constants.dart';
import 'package:flutter/material.dart';

import '../login/login_screen.dart';

class SplashScreen extends StatefulWidget {
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
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height*0.40,
          decoration: BoxDecoration(
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
    );
  }
}
