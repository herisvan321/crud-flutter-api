import 'package:belajarcrud2/ui/screens/actionscreen.dart';
import 'package:belajarcrud2/ui/screens/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:belajarcrud2/ui/screens/homescreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      // ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      initialRoute: "/splasscreen",
      getPages: [
        GetPage(name: "/", page: () => HomeScreen()),
        GetPage(name: "/actionscreen", page: () => ActionScreen()),
        GetPage(name: "/splasscreen", page: () => SplashScreen())
      ],
    );
  }
}
