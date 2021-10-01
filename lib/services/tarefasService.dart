import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:studyxp_mobile/model/tarefaModel.dart';
import 'package:studyxp_mobile/view/home/tarefasPendentes.dart';

Future<List<Tarefa>> getTarefasConcluidas(BuildContext context) async {
  Client cliente = Client();
  Response res = await cliente.get(
    Uri.parse("http://localhost:9090/alunos/tarefas/tarefasconcluidas"),
  );

  if (res.statusCode == 200) {
    List response = jsonDecode(res.body);
    List<Tarefa> tarefas =
        response.map((dynamic item) => Tarefa.fromJson(item)).toList();

    return tarefas;
  } else {
    List<Tarefa> nullable = [];
    return nullable;
  }
}

Future<List<Tarefa>> getTarefasPendentes(BuildContext context) async {
  Client cliente = Client();
  Response res = await cliente.get(
    Uri.parse("http://localhost:9090/alunos/tarefas/tarefaspendentes"),
  );

  if (res.statusCode == 200) {
    List response = jsonDecode(res.body);
    List<Tarefa> tarefas =
        response.map((dynamic item) => Tarefa.fromJson(item)).toList();

    return tarefas;
  } else {
    List<Tarefa> nullable = [];
    return nullable;
  }
}

Future concluirTarefa(BuildContext context, int id, Tarefa tarefa) async {
  Client cliente = Client();
  tarefa.flag = "concluida";

  print(tarefa.flag);

  Object post = {"flag": tarefa.flag};
  Response res = await cliente.post(
    Uri.parse(
      "http://localhost:9090/professores/tarefas/concluirtarefa?id=" +
          id.toString(),
    ),
    body: post,
  );
}

Future voltarTarefa(BuildContext context, int id, Tarefa tarefa) async {
  Client cliente = Client();
  tarefa.flag = "pendente";

  print(tarefa.flag);

  Object post = {"flag": tarefa.flag};
  Response res = await cliente.post(
    Uri.parse(
      "http://localhost:9090/professores/tarefas/voltartarefa?id=" +
          id.toString(),
    ),
    body: post,
  );
}
