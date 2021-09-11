import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:studyxp_mobile/model/alunoModel.dart';
import 'package:studyxp_mobile/model/professorModel.dart';
import 'package:studyxp_mobile/services/snackbarService.dart';
import 'package:studyxp_mobile/view/home/homepage.dart';

Future login(
  String email,
  String password,
  BuildContext context,
) async {
  final res = await Client().post(
    Uri.parse("http://localhost:9090/mobile/login"),
    body: {
      "email": email,
      "password": password,
    },
  );

  try {
    if (res.statusCode == 404) {
      return Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MensagemDeAlertaOK(
            titulo: 'Erro ao Logar',
            descricao: 'Verifique as informações digitadas e tente novamente!',
          ),
        ),
      );
    } else {
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
  } catch (e) {
    return MensagemDeAlertaOK(
      titulo: 'Erro ao Logar',
      descricao: 'Verifique as informações digitadas',
    );
  }
}
