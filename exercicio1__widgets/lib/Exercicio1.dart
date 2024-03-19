//Layout Básico com Container:
//Crie um aplicativo Flutter que utilize o widget Container para criar um layout básico.
//Adicione pelo menos três widgets filhos dentro do Container com diferentes estilos e
//cores.

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
// Obtém informações sobre o ambiente de exibição
    MediaQueryData mediaQueryData = MediaQuery.of(context);

// Determina a largura da tela
    double screenWidth = mediaQueryData.size.width;

// Calcula o tamanho do texto com base na largura da tela
    double textSize = screenWidth * 0.05;

    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('3 Container'),
            ),
            body: Column(children: [
              Container(
                color: const Color.fromARGB(255, 54, 244, 95),
                width: 100,
                height: 100,
                child: Center(child: Text('Container 01'),)
              ),
              Container(
                color: Colors.blue,
                width: 120,
                height: 120,
              ),
              Container(
                color: Colors.red,
                width: 160,
                height: 160,
              )
            ])));
  }
}