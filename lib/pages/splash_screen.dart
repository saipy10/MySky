import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Text message = Text(
    "Loading...",
    style: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 35,
    ),
  );
  AlignmentGeometry centerImage = const Alignment(0, -0.06);
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      setState(() {
        message = Text(
          "Check internet connection and city name",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        );
        centerImage = const Alignment(0, -0.1);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(center: centerImage, colors: [
            Colors.blue.shade100,
            Colors.blue.shade100,
            Colors.blue.shade200,
            Colors.blue.shade200,
            Colors.blue.shade300,
            Colors.blue.shade300,
            Colors.blue.shade400,
            Colors.blue.shade500,
          ]),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 200,
                width: 200,
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/sky.png"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: message,
              )
            ],
          ),
        ),
      ),
    );
  }
}
