import 'package:studyxp_mobile/model/alunoModel.dart';

class ApiModel {
  final Aluno data;
  final String hash;
  final String type;

  ApiModel({
    required this.data,
    required this.hash,
    required this.type,
  });

  factory ApiModel.fromJson(Map<String, dynamic> json) {
    return ApiModel(
      data: json['data'] as Aluno,
      hash: json['hash'] as String,
      type: json['type'] as String,
    );
  }
}
