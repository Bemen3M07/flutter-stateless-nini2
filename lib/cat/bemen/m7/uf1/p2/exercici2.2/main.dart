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

// Estado del widget MainApp que maneja la entrada de texto y diálogos
class MainAppState extends State<MainApp> {
  final TextEditingController nameController = TextEditingController(); // Controlador para el campo de texto del nombre

  // Método para mostrar un saludo personalizado en un diálogo
  void sayHello() {
    String name = nameController.text.trim(); // Obtiene el texto del campo y elimina espacios

    showDialog( // Muestra un diálogo modal
      context: context, // Contexto actual de la aplicación
      builder: (context) { // Constructor del diálogo
        return AlertDialog( // Widget de diálogo de alerta
          title: const Text('Benvinguda'), // Título del diálogo
          content: Text('Hola $name!'), // Contenido del diálogo con el nombre personalizado
          actions: [ // Lista de botones de acción
            TextButton( // Botón de texto para cerrar
              onPressed: () => Navigator.pop(context), // Al presionar, cierra el diálogo
              child: const Text('Tancar'), // Texto del botón
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) { // Método que construye la interfaz
    return MaterialApp( // Aplicación con diseño Material
      home: Scaffold( // Estructura básica de la pantalla
        body: Center( // Centra todo el contenido
          child: Padding( // Añade padding alrededor del contenido
            padding: const EdgeInsets.all(20), // Padding de 20 píxeles en todos los lados
            child: Column( // Organiza widgets en columna vertical
              mainAxisAlignment: MainAxisAlignment.center, // Centra verticalmente
              children: [
                TextField( // Campo de entrada de texto
                  controller: nameController, // Conecta con el controlador para manejar el texto
                  decoration: const InputDecoration( // Decoración del campo de texto
                    labelText: 'Introdueix el teu nom', // Etiqueta que aparece en el campo
                    border: OutlineInputBorder(), // Borde rectangular alrededor del campo
                  ),
                ),
                const SizedBox(height: 20), // Espaciado vertical de 20 píxeles
                ElevatedButton( // Botón elevado para ejecutar la acción
                  onPressed: sayHello, // Al presionar, ejecuta el método sayHello
                  child: const Text('Saludar'), // Texto del botón
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
