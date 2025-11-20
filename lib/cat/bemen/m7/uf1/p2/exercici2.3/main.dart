// Importa la librería de Material Design de Flutter
import 'package:flutter/material.dart';
// Importa la librería dart:math para generar números aleatorios
import 'dart:math';

// Punto de entrada de la aplicación - ejecuta MainApp
void main() {
  runApp(const MainApp());
}

// Widget principal de la aplicación que puede cambiar de estado
class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState(); // Crea el estado del widget
}

// Estado del widget MainApp que maneja la lógica del juego de adivinanza
class _MainAppState extends State<MainApp> {
  TextEditingController controller = TextEditingController(); // Controlador para el campo de entrada del número
  int numeroSecreto = Random().nextInt(101); // Genera número aleatorio entre 0 y 100 (inclusive)
  String mensaje = 'Endivina el número entre 0 y 100'; // Mensaje inicial que se muestra al usuario

  // Método que comprueba si el número ingresado es correcto
  void comprobarNumero() {
    int numeroUsuario = int.parse(controller.text); // Convierte el texto ingresado a entero
    
    setState(() { // Notifica a Flutter que el estado ha cambiado
      if (numeroUsuario < numeroSecreto) { // Si el número es menor al secreto
        mensaje = 'El número és més gran'; // Indica que debe intentar con un número mayor
      } else if (numeroUsuario > numeroSecreto) { // Si el número es mayor al secreto
        mensaje = 'El número és més petit'; // Indica que debe intentar con un número menor
      } else { // Si el número es igual al secreto
        mensaje = 'Has encertat!'; // Mensaje de victoria
      }
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
              Text(mensaje), // Muestra el mensaje actual del juego
              const SizedBox(height: 20), // Espaciado vertical de 20 píxeles
              TextField( // Campo de entrada para el número del usuario
                controller: controller, // Conecta con el controlador para manejar el texto
                decoration: const InputDecoration( // Decoración del campo de texto
                  border: OutlineInputBorder(), // Borde rectangular alrededor del campo
                  labelText: 'Tu número', // Etiqueta que aparece en el campo
                ),
              ),
              const SizedBox(height: 20), // Espaciado vertical de 20 píxeles
              ElevatedButton( // Botón elevado para comprobar el número
                onPressed: comprobarNumero, // Al presionar, ejecuta el método comprobarNumero
                child: const Text('Comprobar'), // Texto del botón
              ),
            ],
          ),
        ),
      ),
    );
  }
}
