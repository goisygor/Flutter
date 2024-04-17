
class Usuarios {
  
  //atributos
  String nome;
  String email;
  String senha;

  Usuarios({
    required this.nome,
    required this.email,
    required this.senha,
  });
  
    Map<String, dynamic> toMap() {
    return {
      'user_name' : nome,
      'user_email' : email,
      'user_senha' : senha,
      };
    }
      factory Usuarios.fromMap(Map<String, dynamic> map) {
    return Usuarios(
      nome: map['user_name'],
      email: map['user_email'],
      senha: map['user_senha'], 
    );
  }
  }
