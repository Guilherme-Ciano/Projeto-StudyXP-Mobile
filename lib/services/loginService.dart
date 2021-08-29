import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:studyxp_mobile/model/alunoModel.dart';
import 'package:studyxp_mobile/model/professorModel.dart';
import 'package:studyxp_mobile/services/snackbarService.dart';
import 'package:studyxp_mobile/view/home/homepage.dart';
import 'package:studyxp_mobile/view/home/homepageProf.dart';

Future login(
  String email,
  String password,
  Client client,
  BuildContext context,
) async {
  final res = await client.post(
    Uri.parse("http://localhost:9090/mobile/login"),
    body: {
      "email": email,
      "password": password,
    },
  );

  return Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => MyHomePageAluno(
        aluno: Aluno.fromJson(
          jsonDecode(res.body),
        ),
      ),
    ),
  );
}
