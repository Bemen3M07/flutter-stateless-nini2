import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// El main inicializa la app y envuelve todo con un ChangeNotifierProvider.
// Esto permite que cualquier widget acceda y escuche los cambios del estado global (CounterProvider).
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CounterProvider(), // Se crea una única instancia del Provider
      child: const MainApp(),
    ),
  );
}

// Clase que extiende ChangeNotifier, lo que permite notificar a los widgets cuando hay cambios en el estado (_count).
class CounterProvider extends ChangeNotifier {
  int _count = 0; // Estado del contador (privado)

  // Getter para que los widgets puedan leer el valor del contador
  int get count => _count;

  // Incrementa el valor del contador y notifica a los listeners
  void increment() {
    _count++;
    notifyListeners(); // Cualquier widget que usa CounterProvider se actualiza
  }

  // Decrementa el contador si es mayor que 0
  void decrement() {
    if (_count > 0) {
      _count--;
      notifyListeners(); // Se vuelve a notificar a los widgets
    }
  }
}



// Widget principal de la app
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Oculta el banner de debug
      home: const HomePage(), // Página principal
    );
  }
}


// Página principal que muestra el contador y los botones 

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    // Accedemos al provider para usar su estado y funciones.
    // Provider.of "escucha" automáticamente los cambios en el estado.
    final counter = Provider.of<CounterProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Provider Counter")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // Texto que muestra el valor actual del contador
            Text(
              'Contador: ${counter.count}',
              style: const TextStyle(fontSize: 24),
            ),

            const SizedBox(height: 30),

            // Botón que llama a increment() y suma 1 al contador
            ElevatedButton(
              onPressed: counter.increment,
              child: const Text("Incrementar"),
            ),

            const SizedBox(height: 20),

            // Botón para restar 1 al contador
            ElevatedButton(
              onPressed: counter.decrement,
              child: const Text("Decrementar"),
            ),
          ],
        ),
      ),
    );
  }
}
