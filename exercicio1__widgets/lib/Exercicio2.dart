// ignore: file_names

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:AppBar(title: Text("Exercicio2")) ,
        body: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Column(
              children: [
                Text('Texto da Primeira Coluna'),
                SizedBox(height: 20),
                Icon(Icons.phone_bluetooth_speaker),

              ],
            ),
            Column(
              children: [
                Text('Texto da Segunda Coluna'),
                SizedBox(height: 20),
                Icon(Icons.phone_callback),
              ],
            ),
            Column(
              children: [
                Text('Texto da Terceira Coluna'),
                SizedBox(height: 20),
                Icon(Icons.phone_android_sharp),
              ],
            ),
          ],),
        )),
    );
  }  
}