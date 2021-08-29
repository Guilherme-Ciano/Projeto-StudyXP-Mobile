class Professor {
  final String nome;
  final String email;
  final String password;
  final String phone;
  final String codEscola;

  Professor({
    required this.nome,
    required this.email,
    required this.password,
    required this.phone,
    required this.codEscola,
  });

  factory Professor.fromJson(Map<String, dynamic> json) {
    return Professor(
      nome: json['nome'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      phone: json['phone'] as String,
      codEscola: json['codEscola'] as String,
    );
  }
}
