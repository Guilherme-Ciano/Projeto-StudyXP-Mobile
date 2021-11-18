import 'dart:convert';
import 'dart:typed_data';

import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:studyxp_mobile/design/design.dart';
import 'package:studyxp_mobile/model/alunoModel.dart';
import 'package:studyxp_mobile/model/tarefaModel.dart';
import 'package:studyxp_mobile/services/arquivosService.dart';
import 'package:studyxp_mobile/services/tarefasService.dart';
import 'dart:html' as html;

class TarefasPendentes extends StatefulWidget {
  final int alunoID;
  final int alunoLevel;
  final Function() notifyParent;
  const TarefasPendentes({
    Key? key,
    required this.alunoID,
    required this.alunoLevel,
    required this.notifyParent,
  }) : super(key: key);

  @override
  _TarefasPendentesState createState() => _TarefasPendentesState();
}

class _TarefasPendentesState extends State<TarefasPendentes> {
  pegarArquivos() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    Uint8List? bytes = result!.files[0].bytes;
    Object request = {
      "file": base64Encode(bytes!),
      "fileName": result.files[0].name
    };

    await Client().post(
      Uri.parse("http://localhost:9090/alunos/img"),
      body: request,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Tarefa>>(
        future: getTarefasPendentes(context),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (!snapshot.hasData || snapshot.data.length == 0) {
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
                                        onPressed: () {
                                          html.window.open(
                                            tarefa.fileLink,
                                            'new tab',
                                          );
                                        },
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
                                        onPressed: () {
                                          pegarArquivos();
                                        },
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
                                            widget.alunoID,
                                            widget.alunoLevel,
                                          );
                                          widget.notifyParent();
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
