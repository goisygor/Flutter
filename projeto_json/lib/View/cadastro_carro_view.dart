import 'package:flutter/material.dart';

class CarroCadastroScreen extends StatefulWidget {
  const CarroCadastroScreen({super.key});

  @override
  State<CarroCadastroScreen> createState() => _CarroCadastroScreenState();
}

class _CarroCadastroScreenState extends State<CarroCadastroScreen> {
  TextEditingController _placaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de Carro"),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Center(
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: _placaController,
                  decoration: const InputDecoration(labelText: "Placa"),
                  validator: (value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Placa não pode ser Vazia';
                    }else{
                      return null;
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
