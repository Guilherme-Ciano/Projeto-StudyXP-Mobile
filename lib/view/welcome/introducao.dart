import 'package:flutter/material.dart';
import 'package:studyxp_mobile/design/design.dart';
import 'package:studyxp_mobile/view/welcome/centerNextButton.dart';
import 'package:studyxp_mobile/view/welcome/loginForm.dart';
import 'package:studyxp_mobile/view/welcome/quartaTela.dart';
import 'package:studyxp_mobile/view/welcome/quintaTela.dart';
import 'package:studyxp_mobile/view/welcome/segundaTela.dart';
import 'package:studyxp_mobile/view/welcome/splashscreen.dart';
import 'package:studyxp_mobile/view/welcome/terceiraTela.dart';
import 'package:studyxp_mobile/view/welcome/topBarSkipView.dart';

class IntroducaoAnimada extends StatefulWidget {
  @override
  _IntroducaoAnimadaState createState() => _IntroducaoAnimadaState();
}

class _IntroducaoAnimadaState extends State<IntroducaoAnimada>
    with TickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 8));
    _animationController?.animateTo(0.0);
    super.initState();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ControleDeCor.Branco,
      body: ClipRect(
        child: Stack(
          children: [
            SplashScreen(
              animationController: _animationController!,
            ),
            SegundaTela(
              animationController: _animationController!,
            ),
            TerceiraTela(
              animationController: _animationController!,
            ),
            QuartaTela(
              animationController: _animationController!,
            ),
            QuintaTela(
              animationController: _animationController!,
            ),
            TopBarSkipView(
              onBackClick: _onBackClick,
              onSkipClick: _onSkipClick,
              animationController: _animationController!,
            ),
            CenterNextButton(
              animationController: _animationController!,
              onNextClick: _onNextClick,
            ),
          ],
        ),
      ),
    );
  }

  void _onSkipClick() {
    _animationController?.animateTo(0.8,
        duration: Duration(milliseconds: 1200));
  }

  void _onBackClick() {
    if (_animationController!.value >= 0 &&
        _animationController!.value <= 0.2) {
      _animationController?.animateTo(0.0);
    } else if (_animationController!.value > 0.2 &&
        _animationController!.value <= 0.4) {
      _animationController?.animateTo(0.2);
    } else if (_animationController!.value > 0.4 &&
        _animationController!.value <= 0.6) {
      _animationController?.animateTo(0.4);
    } else if (_animationController!.value > 0.6 &&
        _animationController!.value <= 0.8) {
      _animationController?.animateTo(0.6);
    } else if (_animationController!.value > 0.8 &&
        _animationController!.value <= 1.0) {
      _animationController?.animateTo(0.8);
    }
  }

  void _onNextClick() {
    if (_animationController!.value >= 0 &&
        _animationController!.value <= 0.2) {
      _animationController?.animateTo(0.4);
    } else if (_animationController!.value > 0.2 &&
        _animationController!.value <= 0.4) {
      _animationController?.animateTo(0.6);
    } else if (_animationController!.value > 0.4 &&
        _animationController!.value <= 0.6) {
      _animationController?.animateTo(0.8);
    } else if (_animationController!.value > 0.6 &&
        _animationController!.value <= 0.8) {
      _signUpClick();
    }
  }

  void _signUpClick() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FormLogin(),
      ),
    );
  }
}
