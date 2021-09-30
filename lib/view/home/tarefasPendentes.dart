import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:studyxp_mobile/design/design.dart';
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
    return FutureBuilder<List<Tarefa>>(
        future: getTarefas(context),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (!snapshot.hasData) {
              return Container(
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
              final DateFormat formatter = DateFormat('dd.MM');
              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  final List<Tarefa> tarefas = snapshot.data;
                  final tarefa = tarefas[index];
                  bool stts;

                  if (double.parse(
                        formatter.format(
                          DateTime.parse(tarefa.limite_data),
                        ),
                      ) <
                      double.parse(
                        formatter.format(
                          DateTime.now(),
                        ),
                      )) {
                    stts = false;
                  } else {
                    stts = true;
                  }

                  if (tarefa.flag == "pendente") {
                    return Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Column(
                        children: [
                          ExpansionTileCard(
                            leading: Icon(Icons.today_outlined),
                            title: Text(
                              tarefa.titulo,
                            ),
                            subtitle: Text(tarefa.xp.toString() + 'xp'),
                            trailing: Text(
                              "Data: " +
                                  formatter.format(
                                      DateTime.parse(tarefa.limite_data)),
                              style: TextStyle(
                                  color: stts
                                      ? Colors.amber
                                      : ControleDeCor.Buttons),
                            ),
                            children: <Widget>[
                              Divider(
                                thickness: 1.0,
                                height: 1.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0,
                                      vertical: 8.0,
                                    ),
                                    child: Text(tarefa.descricao,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2),
                                  ),
                                ),
                              ),
                              ButtonBar(
                                alignment: MainAxisAlignment.spaceAround,
                                buttonHeight: 60,
                                buttonMinWidth: 90,
                                children: [
                                  Row(
                                    children: [
                                      OutlinedButton.icon(
                                        onPressed: () {},
                                        icon: Icon(Icons.description_outlined),
                                        label: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("Baixar"),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 7,
                                      ),
                                      OutlinedButton.icon(
                                        onPressed: () {},
                                        icon: Icon(Icons.add_to_drive_outlined),
                                        label: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("Anexar arquivos"),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 7,
                                      ),
                                      OutlinedButton.icon(
                                        onPressed: () async {
                                          await concluirTarefa(
                                            context,
                                            tarefa.id,
                                            tarefa,
                                          );
                                          setState(() {});
                                        },
                                        icon: Icon(Icons.done),
                                        label: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("Concluir tarefa"),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          )
                        ],
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              );
            }
          } else {
            return Container(
              color: Colors.white,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
