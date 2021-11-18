class Tarefa {
  final String titulo;
  final String descricao;
  final String classe;
  final String limite_data;
  final String fileLink;
  final int xp;
  final int id;
  String flag;
  final String professorId;

  Tarefa({
    required this.titulo,
    required this.descricao,
    required this.classe,
    required this.limite_data,
    required this.xp,
    required this.id,
    required this.flag,
    required this.professorId,
    required this.fileLink,
  });

  factory Tarefa.fromJson(Map<String, dynamic> json) {
    return Tarefa(
      titulo: json['titulo'] as String,
      descricao: json['descricao'] as String,
      classe: json['classe'] as String,
      limite_data: json['limite_data'] as String,
      xp: json['xp'] as int,
      id: json['id'] as int,
      fileLink: json['fileLink'] as String,
      flag: json['flag'] as String,
      professorId: json['professorId'] as String,
    );
  }
}
