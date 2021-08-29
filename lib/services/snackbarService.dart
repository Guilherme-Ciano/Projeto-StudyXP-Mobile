import 'package:flutter/material.dart';
import 'package:studyxp_mobile/design/design.dart';

class MensagemDeAlertaOK extends StatelessWidget {
  final String titulo;
  final String descricao;
  const MensagemDeAlertaOK({
    Key? key,
    required this.titulo,
    required this.descricao,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(titulo),
      content: Text(descricao),
      actions: [
        TextButton(
          child: Text(
            "OK",
            style: TextStyle(
              color: ControleDeCor.Tema,
            ),
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
