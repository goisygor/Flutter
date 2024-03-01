import 'package:app_carros/Model.dart';

class CarrosController {
  List<Carros> _carrosLista = [];

  //métodos
  List<Carros> get listarCarros => _carrosLista;

  // outros métodos
  void adicionarCarros(String modelo, int ano, String imagemUrl) {
    Carros carro = Carros (modelo, ano, imagemUrl);
    _carrosLista.add(carro);
  }
}