import 'dart:async';

import 'package:flutter/material.dart';
import 'package:belajarcrud2/ui/screens/homescreen.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var durasi = const Duration(seconds: 5);
    print("saya");
    return Timer(durasi, () {
      print("hy");
      Get.offAllNamed("/");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("SplashScreen"),
      ),
    );
  }
}
