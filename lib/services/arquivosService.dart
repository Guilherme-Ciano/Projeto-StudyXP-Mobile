import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ArchManager extends StatefulWidget {
  const ArchManager({Key? key}) : super(key: key);

  @override
  _ArchManagerState createState() => _ArchManagerState();
}

class _ArchManagerState extends State<ArchManager> {
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
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () async {
                    await pegarArquivos();
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(width: 2.0, color: Colors.blue),
                  ),
                  child: Text(
                    "Enviar Arquivo",
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
