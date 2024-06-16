

import 'dart:async';

import 'package:flutter/material.dart';


class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;
    Timer(const Duration(seconds:3),(){
      Navigator.of(context).pushReplacementNamed('/intro');
    });
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            gradient:
            RadialGradient(center: Alignment.topLeft, radius: 1,colors: [
              Color(0xff32343b),
              Color(0xff1c1e22),
            ]),
        ),
        child: Center(child: Image.asset('assets/images/logo.png',height: 350,)),
      ),
    );
  }
}
