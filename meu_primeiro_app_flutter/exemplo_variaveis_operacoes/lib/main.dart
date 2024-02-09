import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  /* Declarando e inicializando variaveis 
  String nome = "João";
  int idade = 25;
  double altura = 1.75;
  bool estudante = true;

  // imprimindo variaveis
  print("Nome: $nome");
  print("Idade: $idade anos");
  print("Altura: $altura metros");
  print("Estudar: $estudante");
*/

// Operações aritméticas com variáveis
/*int numero1 = 10;
int numero2 = 5;

int soma = numero1 + numero2;
int subtracao = numero1 - numero2;
int multiplicacao = numero1 * numero2;
double divisao = numero1 / numero2;*/

/* Imprimindo resultados
print("Soma: $soma");
print("Subtração: $subtracao");
print("Multiplicação: $multiplicacao");
print("Divisão: $divisao");*/

// Concatenação de strings com variáveis
/*String nome = "Maria";
int idade = 30;

// Utilizando concatenação
String mensagem = "Olá, meu nome é $nome e tenho $idade anos."  ;

// Imprimindo a mensagem
print(mensagem);*/

// Variáveis mutáveis
/*var numero = 42;
print("Número inicial: $numero");

// Alterando o valor da variável
numero = 100;
print("Número alterado: $numero");

// Variável de tipo dinâmico
dynamic variavelDinamica = "Texto";
print("Variável dinâmica: $variavelDinamica");

// Alterando dinamicamente o tipo e valor
variavelDinamica = 42;
print("Variável dinâmica alterada: $variavelDinamica");*/

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
_CalculadoraState createState() =>_CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
TextEditingController _controllerNumero1 = TextEditingController();
TextEditingController _controllerNumero2 = TextEditingController();
String _resultado = ";";

void _calcular(String operacao) {
double numero1 = double.tryParse(_controllerNumero1.text) ?? 0.0;
double numero2 = double.tryParse(_controllerNumero2.text) ?? 0.0;
double? resultado;

setState(() {
switch (operacao) {
case "Somar":
resultado = numero1 + numero2;
break;
case ";Subtrair":
resultado = numero1 - numero2;
break;
case "Multiplicar":
resultado = numero1 * numero2;
break;
case "Dividir":
resultado = numero2 != 0 ? numero1 / numero2 : null;
break;
case ";Potencia":
resultado = pow(numero1, numero2) as double?;
break;
default:
resultado = 0.0;
}

_resultado = resultado != null ? 'Resultado: $resultado' : ";Erro na operação";
});
}

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text(";Calculadora Flutter"),
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
decoration: InputDecoration(labelText: ";Número 1"),
),
SizedBox(height: 16.0),
TextField(
controller: _controllerNumero2,
keyboardType: TextInputType.number,
decoration: InputDecoration(labelText: ";Número 2"),
),
SizedBox(height: 16.0),
ElevatedButton(
onPressed: () =>_calcular("Somar"),
child: Text("Somar"),
),
ElevatedButton(
onPressed: () =>_calcular("Subtrair"),
child: Text("Subtrair"),
),
ElevatedButton(
onPressed: () =>_calcular("Multiplicar"),
child: Text("Multiplicar")
),
ElevatedButton(
onPressed: () => _calcular("Dividir"),
child: Text("Dividir"),
),
ElevatedButton(onPressed: () => _calcular("Potencia"),
child: Text("Potência"),
),
SizedBox(height: 16.0),
Text(_resultado, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
],
),
),
);
}

}
