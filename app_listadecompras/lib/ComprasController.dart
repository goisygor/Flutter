import 'package:flutter/material.dart';

class Compra {
  String descricao;
  bool concluida;

  Compra(this.descricao, this.concluida);

  String? get nome => descricao;
}

class ComprasController extends ChangeNotifier {
  late BuildContext context;
  List<Compra> _compras = [];

  ComprasController(this.context);

  List<Compra> get compras => _compras;

  String _descricao = '';
  String get descricao => _descricao;

  String get nome => '';

  set descricao(String descricao) {
    _descricao = descricao;
  }

  void addCompra(String descricao) {
    if (descricao.trim().isNotEmpty) {
      bool compraExistente = _compras.any((compra) => compra.descricao == descricao);

      if (compraExistente) {
        showAlertExist(context);
      } else {
        _compras.add(Compra(descricao.trim(), false));
        notifyListeners();
        showAlertSucesso(context);
      }
    } else {
      showAlert(context, 'Atenção', 'Insira uma descrição para a compra');
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
      showAlert(context, 'Atenção', 'Compra atualizada com sucesso');
    }
  }

  void showAlert(BuildContext context, String titulo, String conteudo) {
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

  void showAlertSucesso(BuildContext context) {
    showAlert(context, 'Sucesso', 'Compra adicionada com sucesso');
  }

  void showAlertExist(BuildContext context) {
    showAlert(context, 'Atenção', 'Já existe uma compra com essa descrição');
  }

  void removerCompra(int index) {}

  void adicionarCompra(String descricao) {}
}
