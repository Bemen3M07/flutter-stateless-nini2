import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  TextEditingController controller = TextEditingController();
  int numeroSecreto = Random().nextInt(101); // 0 a 100
  String mensaje = 'Endivina el número entre 0 y 100';

  void comprobarNumero() {
    int numeroUsuario = int.parse(controller.text);
    
    setState(() {
      if (numeroUsuario < numeroSecreto) {
        mensaje = 'El número és més gran';
      } else if (numeroUsuario > numeroSecreto) {
        mensaje = 'El número és més petit';
      } else {
        mensaje = 'Has encertat!';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(mensaje),
              const SizedBox(height: 20),
              TextField(
                controller: controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Tu número',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: comprobarNumero,
                child: const Text('Comprobar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
