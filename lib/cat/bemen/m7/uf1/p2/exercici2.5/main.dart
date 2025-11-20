// Importa la librería de Material Design de Flutter
import 'package:flutter/material.dart';

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

// Estado del widget MainApp que maneja dos contadores independientes
class MainAppState extends State<MainApp> {
  int comptador1 = 0; // Contador del jugador 1 (inicializado en 0)
  int comptador2 = 0; // Contador del jugador 2 (inicializado en 0)
  
  // Método para incrementar el contador del jugador 1
  void incrementarComptador1() {
    setState(() { // Notifica a Flutter que el estado ha cambiado
      comptador1++; // Incrementa en 1 el contador del jugador 1
    });
  }

  // Método para incrementar el contador del jugador 2
  void incrementarComptador2() {
    setState(() { // Notifica a Flutter que el estado ha cambiado
      comptador2++; // Incrementa en 1 el contador del jugador 2
    });
  }
  
  @override
  Widget build(BuildContext context) { // Método que construye la interfaz
    return MaterialApp( // Aplicación con diseño Material
      home: Scaffold( // Estructura básica de la pantalla
        body: Center( // Centra todo el contenido
          child: Row( // Organiza widgets horizontalmente
            mainAxisAlignment: MainAxisAlignment.center, // Centra horizontalmente
            children: [
              Column( // Primera columna para el jugador 1
                mainAxisAlignment: MainAxisAlignment.center, // Centra verticalmente
                children: [
                  Text( // Widget de texto que muestra el valor del contador 1
                    '$comptador1', // Convierte el entero a string para mostrar
                  ),

                  ElevatedButton( // Botón elevado para incrementar contador 1
                    onPressed: incrementarComptador1, // Al presionar, ejecuta incrementarComptador1
                    child: const Text('Score'), // Texto del botón
                  ),
                ],
              ),
              Column( // Segunda columna para el jugador 2
                mainAxisAlignment: MainAxisAlignment.center, // Centra verticalmente
                children: [
                  Text( // Widget de texto que muestra el valor del contador 2
                    '$comptador2', // Convierte el entero a string para mostrar    
                  ),
                  ElevatedButton( // Botón elevado para incrementar contador 2
                    onPressed: incrementarComptador2, // Al presionar, ejecuta incrementarComptador2
                    child: const Text('Score'), // Texto del botón
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}