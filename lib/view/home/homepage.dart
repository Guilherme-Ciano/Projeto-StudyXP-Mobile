import 'dart:html';

import 'package:flutter/material.dart';
import 'package:studyxp_mobile/connection/connection.dart';
import 'package:studyxp_mobile/design/design.dart';
import 'package:studyxp_mobile/model/alunoModel.dart';

class MyHomePage extends StatefulWidget {
  Aluno aluno;
  MyHomePage({Key? key, required this.aluno}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        child: Text(widget.aluno.nome),
      ),
    );
  }
}
