class User {
  //atributos
  int? id;
  String nome;
  String email;
  String senha;
  //construtor
  User({required this.nome, required this.email, required this.senha, id});

  // Método para criar um usuário a partir de um mapa
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      nome: map['u_nome'],
      email: map['u_email'],
      senha: map['u_senha'],
    );
  }

  // Método para converter o usuário em um mapa
  Map<String, dynamic> toMap() {
    return {
      'u_nome': nome,
      'u_email': email,
      'u_senha': senha,
    };
  }
}
