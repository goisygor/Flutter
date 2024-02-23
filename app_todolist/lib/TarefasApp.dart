import 'package:app_todolist/TarefasController.dart';
import 'package:app_todolist/TarefasView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TarefasApp extends StatelessWidget {
  @override
 Widget build(BuildContext context){
  return MaterialApp(
    // definindo a tela inicial como a tarefa
    home: ChangeNotifierProvider(
      create:(context) => TarefaController(),
      child: TarefasScreen(),
      ),
    );
 } 
 
  
}

