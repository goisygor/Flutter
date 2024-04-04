// aonde vou criar meu modelo de dados , seja qual for a aplicação com a modelagem MVC
// o Model é o mue modelo de negocio
// é aqui que vou modelar e vou ter as informações para armazenar

//Lista De Contatos //

class ContatoModel {
  // atributos
  int id;
  String nome;
  String Email;
  String Telefone;
  String Endereco;

// construtor
  ContatoModel({
    required this.id,
    required this.nome,
    required this.Email,
    required this.Telefone,
    required this.Endereco,
  });

  // mapeamento me permite atribuir um valor para a coluna e depois para o atributo
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'email': Email,
      'telefone': Telefone,
      'endereco': Endereco,
    };
  }

  //método para retornar do atributos para a coluna p
  factory ContatoModel.fromMap(Map<String, dynamic> map) {
    return ContatoModel(
      id: map['id'],
      nome: map['nome'],
      Email: map['email'],
      Telefone: map['telefone'],
      Endereco: map['endereco'],
    );
  }
    }
  

