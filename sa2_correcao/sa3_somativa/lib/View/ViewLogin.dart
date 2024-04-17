import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sa3_somativa/Controller/BDD.dart';
import 'package:sa3_somativa/Model/UsuariosModel.dart';
import 'package:sa3_somativa/View/ViewCadastro.dart';
import 'package:sa3_somativa/View/ViewLista.dart';

class PaginaLogin extends StatefulWidget {
  const PaginaLogin({Key? key}) : super(key: key);

  @override
  State<PaginaLogin> createState() => _PaginaLoginState();
}

class _PaginaLoginState extends State<PaginaLogin> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // Chave global para o formulário

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(55, 232, 255, 1),
        title: Text("Login"),
      ),
      body: Center(
        child: Container(
          height: 400,
          child: Form(
            key: _formKey, // Associando o formulário à chave global
            child: Column(
              children: [
                Container(
                  width: 350.0,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person_outline),
                            contentPadding:
                                EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                            labelText: "E-mail",
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira seu e-mail';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _senhaController,
                        obscureText: true,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock_outline),
                            contentPadding:
                                EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                            labelText: "Senha",
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira sua senha';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () async {
                          // Verificar se o formulário é válido
                          if (_formKey.currentState!.validate()) {
                            String email = _emailController.text;
                            String senha = _senhaController.text;

                            // Verificar se o usuário existe no banco de dados
                            Usuarios? usuarioExiste =
                                await BDD().getUsuario(email, senha);

                            if (usuarioExiste != null) {
                              // Se o usuário existe, navegue para a HomePage
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PaginaLista()));
                            } else {
                              // Se o usuário não existe, exiba uma mensagem
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text('Usuário não encontrado')));
                            }
                          }
                        },
                        child: Text("Entrar"),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                          backgroundColor: Color.fromRGBO(38, 240, 247, 1),
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PaginaCadastro()));
                          },
                          child: Text("Ainda não tem conta?     Cadastre-se")),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
