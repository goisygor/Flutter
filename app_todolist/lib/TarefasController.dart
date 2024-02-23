import 'package:app_todolist/TarefasModel.dart';
import 'package:flutter/material.dart';

class TarefaController extends ChangeNotifier {
  List<Tarefas> _tarefas = [];

  List<Tarefas> get tarefas => _tarefas;

  get indice => null;

  void adicionarTarefa(String descricao) {
    if(descricao.trim().isNotEmpty) {
    }
    tarefas.add(Tarefas(descricao, false));
    // Notifica os ouvintes (widget) sobre a mudança no estado
    notifyListeners();
  }

//Metodo oara marcar uma tarefa como concluida com base no indice
  void marcarComoConcluida(int indidce) {
    if (indidce >= 0 && indice < _tarefas.length) {
      _tarefas[indice].concluida = true;
// Notifica os ouvintes (widget) sobre a mudança no estado
      notifyListeners();
    }
  }

// metodo mara excluir uma tarefa com base no indice
  void excluirTarefa(int indice) {
    if (indice >= 0 && indice < _tarefas.length) {
      _tarefas.removeAt(indice);
      // Notifica os ouvintes sobre a mudança no estado
      notifyListeners();
    }
  }
}
