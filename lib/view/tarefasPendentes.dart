import 'package:flutter/material.dart';
import 'package:studyxp_mobile/model/alunoModel.dart';
import 'package:studyxp_mobile/model/tarefaModel.dart';
import 'package:studyxp_mobile/services/tarefasService.dart';

class TarefasPendentes extends StatefulWidget {
  const TarefasPendentes({Key? key}) : super(key: key);

  @override
  _TarefasPendentesState createState() => _TarefasPendentesState();
}

class _TarefasPendentesState extends State<TarefasPendentes> {
  @override
  Widget build(BuildContext context) {
    final Future<dynamic> tarefas = getTarefas(context);

    return FutureBuilder(
      future: tarefas,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Container(
            height: MediaQuery.of(context).size.height - 136,
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset(
                      'lib/design/images/chill.png',
                    ),
                  ),
                  Text('Descanse, no momento não há mais tarefas.')
                ],
              ),
            ),
          );
        } else {
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              final Tarefa tarefa = snapshot.data[index];
              return ListTile(
                leading: Icon(Icons.today_outlined),
                title: Text(tarefa.titulo),
                subtitle: Text(tarefa.xp.toString() + 'xp'),
                trailing: Text(tarefa.limite_data),
              );
            },
          );
        }
      },
    );
  }
}
