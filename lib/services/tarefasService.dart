import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:restart_app/restart_app.dart';
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

Future concluirTarefa(
  BuildContext context,
  int id,
  Tarefa tarefa,
  int alunoID,
  int alunoLVL,
) async {
  Client cliente = Client();
  tarefa.flag = "concluida";

  Object post = {"flag": tarefa.flag};
  Response res = await cliente.post(
    Uri.parse(
      "http://localhost:9090/professores/tarefas/concluirtarefa?id=" +
          id.toString(),
    ),
    body: post,
  );

  Object post2 = {"level": (alunoLVL + 1).toString()};
  print(post2);
  Response res2 = await cliente.post(
    Uri.parse(
      "http://localhost:9090/alunos/update?id=" + alunoID.toString(),
    ),
    body: post2,
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
