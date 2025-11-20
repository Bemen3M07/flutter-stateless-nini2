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

// Estado del widget MainApp que maneja los cambios
class MainAppState extends State<MainApp> {
  String greeting = 'Good ?!'; // Variable de estado para el saludo inicial

  // Método para actualizar el saludo según la hora del día
  void updateGreeting(String timeOfDay) {
    setState(() { // Notifica a Flutter que el estado ha cambiado
      greeting = 'Good $timeOfDay!'; // Actualiza el saludo con el parámetro recibido
    });
  }

  @override
  Widget build(BuildContext context) { // Método que construye la interfaz
    return MaterialApp( // Aplicación con diseño Material
      home: Scaffold( // Estructura básica de la pantalla
        body: Center( // Centra todo el contenido
          child: Column( // Organiza widgets en columna vertical
            mainAxisAlignment: MainAxisAlignment.center, // Centra verticalmente
            children: [
              Text( // Widget de texto que muestra el saludo
                greeting, // Contenido del texto (variable de estado)
                style: const TextStyle(fontSize: 24), // Estilo: tamaño de fuente 24
              ),
              const SizedBox(height: 30), // Espaciado vertical de 30 píxeles
              ElevatedButton( // Botón elevado para "Morning"
                onPressed: () => updateGreeting('Morning'), // Al presionar, actualiza a "Good Morning!"
                child: const Text('Morning'), // Texto del botón
              ),
              const SizedBox(height: 20), // Espaciado vertical de 20 píxeles
              ElevatedButton( // Botón elevado para "Night"
                onPressed: () => updateGreeting('Night'), // Al presionar, actualiza a "Good Night!"
                child: const Text('Night'), // Texto del botón
              ),
            ],
          ),
        ),
      ),
    );
  }
}
