import 'package:app_listadecompras/ComprasModel.dart';
import 'package:flutter/material.dart';

class ComprasController extends ChangeNotifier {
  late BuildContext context;
  List<ComprasModel> _compras = [];

  ComprasController(BuildContext context);

  List<ComprasModel> get compras => _compras;

  set descricao(String descricao) {}

  void addCompra(String descricao) {
    if (descricao.trim().isNotEmpty) {
      bool compraExistente = _compras.any((compra) => compra.descricao == descricao);

      if (compraExistente) {
        _showAlert(context, 'Atenção', 'Já existe uma compra com essa descrição');
      } else {
        _compras.add(ComprasModel(descricao.trim(), false));
        notifyListeners();
        _showAlert(context, 'Sucesso', 'Compra adicionada com sucesso');
      }
    } else {
      _showAlert(context, 'Atenção', 'Insira uma descrição para a compra');
    }
  }

  void marcarComoConcluida(int indice) {
    if (indice >= 0 && indice < _compras.length) {
      _compras[indice].concluida = !_compras[indice].concluida;
      notifyListeners();
    }
  }

  void excluirCompra(int indice) {
    if (indice >= 0 && indice < _compras.length) {
      _compras.removeAt(indice);
      notifyListeners();
    }
  }

  void atualizarCompra(int indice, String novaDescricao) {
    if (indice >= 0 && indice < _compras.length) {
      _compras[indice].descricao = novaDescricao;
      notifyListeners();
      _showAlert(context, 'Atenção', 'Compra atualizada com sucesso');
    }
  }

  void _showAlert(BuildContext context, String titulo, String conteudo) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(titulo),
          content: Text(conteudo),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void removerCompra(int index) {
    if (index >= 0 && index < _compras.length) {
      _compras.removeAt(index);
      notifyListeners();
    }
  }

  void adicionarCompra(String descricao) {
    addCompra(descricao);
  }
}
