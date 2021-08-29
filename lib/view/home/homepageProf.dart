import 'package:flutter/material.dart';
import 'package:studyxp_mobile/model/professorModel.dart';
import 'package:studyxp_mobile/services/snackbarService.dart';

class MyHomePageProf extends StatefulWidget {
  final Professor prof;
  MyHomePageProf({Key? key, required this.prof}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePageProf> {
  @override
  Widget build(BuildContext context) {
    MensagemDeAlertaOK(
      titulo: 'Bem Vindo, ' + widget.prof.nome,
      descricao: '',
    );

    return Scaffold(
      body: Card(
        child: Text(widget.prof.nome),
      ),
    );
  }
}
