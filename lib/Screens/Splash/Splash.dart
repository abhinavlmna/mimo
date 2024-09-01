import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mimo/Screens/Home/homepage.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => Homepage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'mimo',
          style: TextStyle(
              fontSize: 120, fontFamily: 'Lobster', color: Colors.black),
        ),
      ),
    );
  }
}
