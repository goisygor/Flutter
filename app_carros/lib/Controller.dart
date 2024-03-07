import 'package:app_carros/Model.dart';
import 'package:flutter/material.dart';

class CarroController extends ChangeNotifier {
  //atributo
  List<Carro> _carrosLista = [];

  //métodos
  List<Carro> get listarCarros => _carrosLista;

  //outros métodos
  void adicionarCarro(String modelo, int ano, String imagemUrl) {
    Carro carro = Carro(modelo, ano, imagemUrl);
    _carrosLista.add(carro);
    notifyListeners();
  }
}