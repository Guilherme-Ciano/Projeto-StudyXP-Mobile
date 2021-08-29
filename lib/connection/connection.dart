import 'dart:convert';
import 'package:http/http.dart';
import 'package:studyxp_mobile/model/alunoModel.dart';

class HttpService {
  static Future<List<Aluno>> getAlunos() async {
    final String BASE_URL = "http://localhost:9090/alunos/index";
    Response res = await get(Uri.parse(BASE_URL));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Aluno> Alunos = body
          .map(
            (dynamic item) => Aluno.fromJson(item),
          )
          .toList();

      return Alunos;
    } else {
      throw "Não foi possível pegar as mesas";
    }
  }
}
