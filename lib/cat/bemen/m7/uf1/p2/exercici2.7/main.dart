// Importa la librería de Material Design de Flutter
import 'package:flutter/material.dart';
// Importa la librería Provider para gestión de estado global
import 'package:provider/provider.dart';

// Punto de entrada de la aplicación con configuración de Provider
void main() {
  runApp( // Ejecuta la aplicación
    ChangeNotifierProvider( // Proveedor que gestiona el estado global
      create: (context) => CounterProvider(), // Crea una instancia del provider
      child: const MainApp(), // Widget hijo que tendrá acceso al provider
    ),
  );
}

// Clase Provider que extiende ChangeNotifier para gestión de estado
class CounterProvider extends ChangeNotifier {
  int _count = 0; // Variable privada que almacena el valor del contador

  // Getter público para acceder al valor del contador desde otros widgets
  int get count => _count;

  // Método para incrementar el contador
  void increment() {
    _count++; // Incrementa el valor en 1
    notifyListeners(); // Notifica a todos los widgets que escuchan este provider
  }

  // Método para decrementar el contador
  void decrement() {
    if (_count > 0) { // Verifica que el contador sea mayor que 0
      _count--; // Decrementa el valor en 1
      notifyListeners(); // Notifica a todos los widgets que escuchan este provider
    }
  }
}

// Widget principal de la aplicación (sin estado)
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) { // Método que construye la interfaz
    return const MaterialApp( // Aplicación con diseño Material
      debugShowCheckedModeBanner: false, // Oculta el banner de debug en la esquina
      home: HomePage(), // Define HomePage como pantalla principal
    );
  }
}

// Página principal que contiene la interfaz del contador
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) { // Método que construye la interfaz de la página

    // Obtiene la instancia del CounterProvider para acceder a sus datos y métodos
    final counter = Provider.of<CounterProvider>(context);

    return Scaffold( // Estructura básica de la pantalla
      appBar: AppBar(title: const Text("Provider Counter")), // Barra superior con título
      body: Center( // Centra todo el contenido
        child: Column( // Organiza widgets en columna vertical
          mainAxisAlignment: MainAxisAlignment.center, // Centra verticalmente
          children: [

            // Widget de texto que muestra el valor actual del contador
            Text(
              'Contador: ${counter.count}', // Accede al valor del contador a través del provider
              style: const TextStyle(fontSize: 24), // Estilo del texto con tamaño 24
            ),

            const SizedBox(height: 30), // Espaciado vertical de 30 píxeles

            // Botón para incrementar el contador
            ElevatedButton(
              onPressed: counter.increment, // Al presionar, ejecuta el método increment del provider
              child: const Text("Incrementar"), // Texto del botón
            ),

            const SizedBox(height: 20), // Espaciado vertical de 20 píxeles

            // Botón para decrementar el contador
            ElevatedButton(
              onPressed: counter.decrement, // Al presionar, ejecuta el método decrement del provider
              child: const Text("Decrementar"), // Texto del botón
            ),
          ],
        ),
      ),
    );
  }
}
