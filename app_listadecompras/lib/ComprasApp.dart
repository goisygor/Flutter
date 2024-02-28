import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ComprasController.dart';
import 'ComprasView.dart';

void main() {
  runApp(ComprasApp());
}

class ComprasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => ComprasController(context),
        child: ComprasView(),
      ),
    );
  }
}

Widget ComprasView() {
  return ComprasView(); // Você pode substituir Container() pelo widget desejado
}