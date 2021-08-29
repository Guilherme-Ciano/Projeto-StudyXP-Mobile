class Aluno {
  final int id;
  final String nome;
  final String email;
  final String password;
  final String phone;
  final String ra;
  final int grade;
  final int level;

  Aluno({
    required this.id,
    required this.nome,
    required this.email,
    required this.password,
    required this.phone,
    required this.ra,
    required this.grade,
    required this.level,
  });

  factory Aluno.fromJson(Map<String, dynamic> json) {
    return Aluno(
      id: json['id'] as int,
      nome: json['nome'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      phone: json['phone'] as String,
      ra: json['ra'] as String,
      grade: json['grade'] as int,
      level: json['level'] as int,
    );
  }
}
