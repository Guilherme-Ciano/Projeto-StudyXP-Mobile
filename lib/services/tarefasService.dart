import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:studyxp_mobile/model/tarefaModel.dart';
import 'package:studyxp_mobile/view/tarefasPendentes.dart';

Future getTarefas(BuildContext context) async {
  Client cliente = Client();
  Response res = await cliente.get(
    Uri.parse("http://localhost:9090/alunos/tarefas/index"),
  );

  if (res.statusCode == 200) {
    List response = jsonDecode(res.body);
    print(response);

    List<Tarefa> tarefas =
        response.map((dynamic item) => Tarefa.fromJson(item)).toList();
    print(tarefas);

    return tarefas;
  }
}
