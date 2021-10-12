import 'dart:html';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studyxp_mobile/services/loginService.dart';
import 'package:studyxp_mobile/services/snackbarService.dart';
import 'package:studyxp_mobile/view/welcome/introducao.dart';

class SplashLoad extends StatefulWidget {
  const SplashLoad({Key? key}) : super(key: key);

  @override
  _SplashLoadState createState() => _SplashLoadState();
}

class _SplashLoadState extends State<SplashLoad> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final userController = TextEditingController();
  final passwordController = TextEditingController();

  getUserAccess() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? user = prefs.getString('User') ?? "";
    String? pass = prefs.getString('UserPass') ?? "";
    if (user == "" || pass == "") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => IntroducaoAnimada(),
        ),
      );
    } else {
      userController.text = user;
      passwordController.text = pass;
      login(
        userController.text,
        passwordController.text,
        context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward().whenComplete(() => getUserAccess());
    return FadeTransition(
      opacity: _animation,
      child: Container(
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 350, maxHeight: 350),
            child: Image.asset(
              'lib/design/images/Logo_StudyXP.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
