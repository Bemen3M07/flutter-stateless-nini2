// Importa la librería dart:math para generar números aleatorios
import 'dart:math';
// Importa la librería de Material Design de Flutter
import 'package:flutter/material.dart';
// Importa la librería flutter_svg para mostrar imágenes SVG
import 'package:flutter_svg/flutter_svg.dart';

// Punto de entrada de la aplicación - ejecuta MainApp
void main() {
  runApp(const MainApp());
}

// Widget principal de la aplicación que puede cambiar de estado
class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => MainAppState(); // Crea el estado del widget
}

// Estado del widget MainApp que maneja la simulación de dados
class MainAppState extends State<MainApp> {
  final Random random = Random(); // Instancia del generador de números aleatorios

  int dice1 = 1; // Valor del primer dado (inicializado en 1)
  int dice2 = 1; // Valor del segundo dado (inicializado en 1)

  // Método para lanzar los dados y actualizar sus valores
  void rollDice() {
    setState(() { // Notifica a Flutter que el estado ha cambiado
      dice1 = random.nextInt(6) + 1; // Genera número aleatorio entre 1 y 6 para el primer dado
      dice2 = random.nextInt(6) + 1; // Genera número aleatorio entre 1 y 6 para el segundo dado
    });

    // Verifica si ambos dados muestran 6 (jackpot)
    if (dice1 == 6 && dice2 == 6) {
      ScaffoldMessenger.of(context).showSnackBar( // Muestra una notificación en la parte inferior
        const SnackBar( // Widget de notificación temporal
          content: Text("JACKPOT!"), // Mensaje de la notificación
          duration: Duration(seconds: 2), // Duración de 2 segundos
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) { // Método que construye la interfaz
    return MaterialApp( // Aplicación con diseño Material
      home: Scaffold( // Estructura básica de la pantalla
        backgroundColor: const Color(0xFF1A1A1A), // Color de fondo gris muy oscuro
        body: Center( // Centra todo el contenido
          child: Column( // Organiza widgets en columna vertical
            mainAxisAlignment: MainAxisAlignment.center, // Centra verticalmente
            children: [
              Row( // Organiza los dados horizontalmente
                mainAxisAlignment: MainAxisAlignment.center, // Centra horizontalmente
                children: [
                  SvgPicture.asset("assets/dice_$dice1.svg", width: 120), // Imagen SVG del primer dado con ancho de 120
                  const SizedBox(width: 20), // Espaciado horizontal de 20 píxeles entre dados
                  SvgPicture.asset("assets/dice_$dice2.svg", width: 120), // Imagen SVG del segundo dado con ancho de 120
                ],
              ),
              const SizedBox(height: 40), // Espaciado vertical de 40 píxeles
              ElevatedButton( // Botón elevado para lanzar los dados
                onPressed: rollDice, // Al presionar, ejecuta el método rollDice
                child: const Text("ROLL THE DICE"), // Texto del botón
              ),
            ],
          ),
        ),
      ),
    );
  }
}
