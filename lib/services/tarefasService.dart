import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:studyxp_mobile/model/tarefaModel.dart';
import 'package:studyxp_mobile/view/tarefasPendentes.dart';

Future getTarefas(BuildContext context) async {
  final res = await post(
    Uri.parse("http://localhost:9090/alunos/tarefas/index"),
  );

  if (res.statusCode == 200) {
    var response = res.body;
    Future<dynamic> tarefas = jsonDecode(response);
    print(tarefas);

    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TarefasPendentes(),
      ),
    );
  }
}
