import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(CalculadoraApp());
}

class CalculadoraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculadora(),
    );
  }
}

class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  TextEditingController _controllerNumero1 = TextEditingController();
  String _resultado = '';
  int _contador = 0;
  int numeroSorteado = Random().nextInt(100);

  void _adivinhar() {
  int? numero = int.tryParse(_controllerNumero1.text);

  setState(() {
    _contador++;
    if (_contador == 10) {
      _resultado = 'Você é Burro ! Errou o número 10 vezes !';
    } else if (numero != null) {
      if (numero == numeroSorteado) {
        _resultado = 'Parabéns! Você adivinhou o número $numeroSorteado!';
      } else if (numero < numeroSorteado) {
        _resultado = 'Tente um número maior.';
      } else {
        _resultado = 'Tente um número menor.';
      }
    } else {
      _resultado = 'Por favor, digite um número válido.';
    }
    void _reiniciarJogo() {
  setState(() {
    numeroSorteado = Random().nextInt(100);
    _controllerNumero1.clear();
    _resultado = '';
    _contador = 0; // Reinicia o contador de jogadas
    if (_resultado.isNotEmpty && _resultado.startsWith('Parabéns'))
              ElevatedButton(
                onPressed: () => _reiniciarJogo(),
                child: Text('Reiniciar Jogo'),
              );
  });
}
  });
}

  void _reiniciarJogo() {
  setState(() {
    numeroSorteado = Random().nextInt(100);
    _controllerNumero1.clear();
    _resultado = '';
    _contador = 0; // Reinicia o contador de jogadas
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jogo Adivinhação'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controllerNumero1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Digite um Nº'),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () => _adivinhar(),
              child: Text('Adivinhar'),
            ),
            SizedBox(height: 16.0),
            Text(
              _resultado,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            if (_resultado.isNotEmpty && _resultado.startsWith('Parabéns'))
              ElevatedButton(
                onPressed: () => _reiniciarJogo(),
                child: Text('Reiniciar Jogo'),
              ),
            SizedBox(height: 16.0),
            Text(
              'Jogadas: $_contador',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
