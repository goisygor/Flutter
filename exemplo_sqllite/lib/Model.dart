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

 // mapeamento me permite atribuir um valor
}
