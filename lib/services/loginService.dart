import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:studyxp_mobile/model/alunoModel.dart';
import 'package:studyxp_mobile/view/home/homepage.dart';

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
      builder: (context) => MyHomePage(
        aluno: Aluno.fromJson(
          jsonDecode(res.body),
        ),
      ),
    ),
  );
}
