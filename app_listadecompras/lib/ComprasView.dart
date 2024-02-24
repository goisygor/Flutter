import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ComprasController.dart';

class ComprasScreen extends StatelessWidget {
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
            child: Consumer<ComprasController>(
              builder: (context, comprasController, child) {
                return TextField(
                  onChanged: (text) {
                    // Atualiza a descrição na ComprasController
                    comprasController.descricao = text;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Nova Compra",
                    suffixIcon: IconButton(
                      onPressed: (){
                        // Adiciona a compra com a nova descrição
                        comprasController.adicionarCompra(comprasController.descricao);
                        // Limpa o campo de texto
                        comprasController.descricao = '';
                      },
                      icon: Icon(Icons.add),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Consumer<ComprasController>(
              builder: (context, comprasController, child) {
                return ListView.builder(
                  itemCount: comprasController.compras.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(comprasController.compras[index].nome ?? ''),
                      subtitle: Text(comprasController.compras[index].descricao ?? ''),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: (){
                          comprasController.removerCompra(index);
                        },
                      ),
                      onLongPress: (){
                        comprasController.excluirCompra(index);
                      },
                      leading: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: (){
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Atualizar Compra"),
                                content: TextField(
                                  onChanged: (text) {
                                    // Atualiza a descrição na ComprasController
                                    comprasController.descricao = text;
                                  },
                                  controller: TextEditingController(text: comprasController.compras[index].descricao),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "Nova Compra",
                                    suffixIcon: IconButton(
                                      onPressed: (){
                                        // Atualiza a compra com a nova descrição
                                        comprasController.atualizarCompra(index, comprasController.descricao);
                                        Navigator.of(context).pop();
                                      },
                                      icon: Icon(Icons.save),
                                    ),
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    child: Text("Cancelar"),
                                    onPressed: (){
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
