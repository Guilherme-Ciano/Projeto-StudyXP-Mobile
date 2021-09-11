import 'package:flutter/material.dart';
import 'package:studyxp_mobile/view/sweetLoad/splashLoad.dart';
import 'package:studyxp_mobile/view/welcome/introducao.dart';
import 'package:studyxp_mobile/view/welcome/loginForm.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashLoad(), // IntroducaoAnimada
    );
  }
}
