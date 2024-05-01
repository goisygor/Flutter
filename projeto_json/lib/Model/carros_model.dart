// placa,
//modelo,
//marca,
//ano,
//cor,
//descricao,
//foto,
//valor

class Carro {
  //atributos
  final String placa;
  final String modelo;
  final String marca;
  final int ano;
  final String cor;
  final String descricao;
  final String foto;
  final double valor;

  //construtor

  Carro(this.placa, 
  this.modelo, 
  this.marca, 
  this.ano, 
  this.cor, 
  this.descricao,
  this.foto,
  this.valor);

  Map<String, dynamic> toJson(){
    return {
      'placa': placa,
     'modelo': modelo,
     'marca': marca,
      'ano': ano,
      'cor': cor,
      'descricao': descricao,
      'foto': foto,
      'valor': valor,
    };
  }
  // métodos void nao retornada nada, métodos return ele me retorna o MAPEAMENTO 
  factory Carro.fromJson(Map<String, dynamic> map){
    return Carro(
      map['placa'],
      map['modelo'],
      map['marca'],
      map['ano'],
      map['cor'],
      map['descricao'],
      map['foto'],
      map['valor'],
    );
  }
}
