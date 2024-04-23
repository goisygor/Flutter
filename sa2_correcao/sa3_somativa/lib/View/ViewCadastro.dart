import 'package:flutter/material.dart';
import 'package:sa3_somativa/Controller/BDD.dart';
import 'package:sa3_somativa/Model/UsuariosModel.dart';
import 'package:sa3_somativa/View/ViewLogin.dart';

class PaginaCadastro extends StatefulWidget {
  const PaginaCadastro({Key? key}) : super(key: key);

  @override
  State<PaginaCadastro> createState() => _PaginaCadastroState();
}

class _PaginaCadastroState extends State<PaginaCadastro> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(55, 232, 255, 1),
        titleTextStyle: TextStyle(color: Color.fromRGBO(0, 0, 0, 1)),
        title: Text("Cadastro"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    CircleAvatar(
                      radius: 50.0,
                     backgroundImage: AssetImage('images/icone.png'),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person_outline),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                        labelText: "Name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                        labelText: "E-mail",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _senhaController,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                        labelText: "Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                      ),
                    ),
                    SizedBox(height: 20),
                   ElevatedButton(
  onPressed: () async {
    if (_usernameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _senhaController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Preencha todos os Campos')),
      );
    } else {
      // Verificar se o e-mail já está cadastrado
      bool emailJaCadastrado = await BDD().existsUsuario(_emailController.text);
      
      if (emailJaCadastrado) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('E-mail já cadastrado')),
        );
      } else {
        // Criar e inserir o usuário no banco de dados
        Usuarios model = Usuarios(
          nome: _usernameController.text,
          email: _emailController.text,
          senha: _senhaController.text,
        );

        // Cadastro bem-sucedido
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Cadastro feito com sucesso')),
        );

        // Agora, vamos criar o usuário no banco de dados
        await BDD().create(model);

        // Após a criação do usuário, navegar para a página de login
        Navigator.push(context, MaterialPageRoute(builder: (context) => PaginaLogin()));
      }
    }
  },
  child: Text("Enviar", style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
  style: ElevatedButton.styleFrom(
    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
    backgroundColor: Color.fromRGBO(42, 255, 244, 1),
  ),
),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}