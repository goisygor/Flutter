import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedWidgetExample(),
    );
  }
}

class AnimatedWidgetExample extends StatefulWidget {
  @override
  _AnimatedWidgetExampleState createState() => _AnimatedWidgetExampleState();
}

class _AnimatedWidgetExampleState extends State<AnimatedWidgetExample> {
  // Variável para controlar se a animação está ativa ou não
  bool _isAnimated = false;

  // Método para alternar o estado da animação
  void _toggleAnimation() {
    setState(() {
      _isAnimated = !_isAnimated;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animação de Widget'),
      ),
      body: Center(
        // GestureDetector para detectar toques e chamar o método _toggleAnimation
        child: GestureDetector(
          onTap: _toggleAnimation,
          child: AnimatedContainer(
            // Propriedades do container que serão animadas
            width: _isAnimated ? 200 : 100,
            height: _isAnimated ? 200 : 100,
            color: _isAnimated ? Colors.blue : Colors.red,
            duration: Duration(seconds: 1), // Duração da animação
            curve: Curves.easeInOut, // Curva de animação
            child: Center(
              child: Text(
                'Toque aqui',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}