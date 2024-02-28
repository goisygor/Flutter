import 'package:flutter/material.dart';

class ComprasScreen extends StatefulWidget {
  @override
  _ComprasScreenState createState() => _ComprasScreenState();
}

class _ComprasScreenState extends State<ComprasScreen> {
  TextEditingController _descricaoController = TextEditingController();
  List<String> _compras = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista De Compras"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _descricaoController,
                    onChanged: (text) {
                      // Atualiza a descrição
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Nova Compra",
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    _adicionarCompra(_descricaoController.text);
                    _descricaoController.clear();
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _compras.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_compras[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _removerCompra(index);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _adicionarCompra(String descricao) {
    if (descricao.trim().isNotEmpty) {
      setState(() {
        _compras.add(descricao.trim());
      });
    }
  }

  void _removerCompra(int index) {
    setState(() {
      _compras.removeAt(index);
    });
  }
}
