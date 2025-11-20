import 'package:flutter/material.dart';
import 'dart:math';

// Punto de entrada de la aplicación - crea MaterialApp con ExerciseApp como home
void main() => runApp(MaterialApp(home: ExerciseApp(), debugShowCheckedModeBanner: false));

// Widget principal que contiene toda la navegación de ejercicios
class ExerciseApp extends StatefulWidget {
  const ExerciseApp({super.key});

  @override
  State<ExerciseApp> createState() => _ExerciseAppState();
}

class _ExerciseAppState extends State<ExerciseApp> {
  int page = 0, exercise = 0; // page: 0=StatelessWidget, 1=StatefulWidget; exercise: índice del ejercicio actual

  // Array bidimensional: [página][ejercicio] - contiene todas las funciones que retornan widgets
  final exercises = [
    // Página 0: Ejercicios StatelessWidget (widgets inmutables)
    [
      // Ejercicio 1: Hello World simple - muestra texto centrado
      () => const Center(child: Text('Hello World!', style: TextStyle(fontSize: 24))),
      // Ejercicio 2: Pantalla de bienvenida - Column con texto y botones deshabilitados
      () => const Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('Welcome!', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)), // Título principal
        SizedBox(height: 10), Text('Start learning now'), SizedBox(height: 20), // Subtítulo con espaciado
        ElevatedButton(onPressed: null, child: Text('Login')), // Botón Login (deshabilitado)
        TextButton(onPressed: null, child: Text('Register')), // Botón Register (deshabilitado)
      ])),
      // Ejercicio 3: Mostrar imagen - Column con texto e icono
      () => const Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
        Text('This is a resource string'), SizedBox(height: 16), Icon(Icons.image, size: 100) // Icono como placeholder de imagen
      ])),
      // Ejercicio 4: Información de contacto - datos estáticos en Column
      () => const Padding(padding: EdgeInsets.all(20), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Nom: Marta Casserres', style: TextStyle(fontSize: 18)), SizedBox(height: 10), // Nombre
        Text('Email: marta@example.com', style: TextStyle(fontSize: 18)), SizedBox(height: 10), // Email
        Text('Telèfon: 934748474', style: TextStyle(fontSize: 18)), // Teléfono
      ])),
      // Ejercicio 5: Lista de mensajes - ListView.builder con datos simulados
      () => ListView.builder(itemCount: 20, itemBuilder: (c, i) {
        final names = ["Ana", "Juan", "María", "Pedro", "Luis"]; // Array de nombres
        return Card(margin: const EdgeInsets.all(8), child: ListTile( // Card con ListTile para cada mensaje
          leading: CircleAvatar(child: Text(names[i % 5][0])), // Avatar con primera letra del nombre
          title: Text(names[i % 5]), subtitle: const Text('Lorem ipsum dolor sit amet'), // Título y subtítulo
        ));
      }),
      // Ejercicio 6: Lista avanzada - Column con header y ListView expandido
      () => Column(children: [
        Container(padding: const EdgeInsets.all(16), color: Colors.blue.shade50, width: double.infinity, // Header azul
          child: const Text('Advanced List', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        Expanded(child: ListView.builder(itemCount: 15, itemBuilder: (c, i) => // Lista expandida con 15 items
          ListTile(leading: CircleAvatar(child: Text('${i+1}')), title: Text('Item $i')))), // Items numerados
      ]),
    ],
    // Página 1: Ejercicios StatefulWidget (widgets con estado mutable)
    [
      () => GreetingEx(), // Ejercicio 2.1: Cambiar saludo (Morning/Night)
      () => NameEx(), // Ejercicio 2.2: Input de nombre con diálogo
      () => GuessEx(), // Ejercicio 2.3: Juego adivinar número
      () => DiceEx(), // Ejercicio 2.4: Simulador de dados
      () => CounterEx(), // Ejercicio 2.5: Contador doble
      () => ShopEx(), // Ejercicio 2.6: Lista de compras
      () => ProviderEx(), // Ejercicio 2.7: Ejemplo Provider simplificado
    ],
  ];

  @override
  Widget build(BuildContext context) => Scaffold( // Estructura principal de la app
    appBar: AppBar( // Barra superior
      title: Text(page == 0 ? 'StatelessWidgets' : 'StatefulWidgets'), // Título dinámico según página
      backgroundColor: page == 0 ? Colors.blue : Colors.green, foregroundColor: Colors.white, // Color dinámico
      actions: [PopupMenuButton<int>( // Menú desplegable para seleccionar ejercicios
        onSelected: (i) => setState(() => exercise = i), // Cambia ejercicio al seleccionar
        itemBuilder: (_) => List.generate(7, (i) => PopupMenuItem(value: i, child: Text('Ejercicio ${i+1}'))), // 7 opciones
      )],
    ),
    body: exercises[page][exercise](), // Ejecuta función del ejercicio actual
    bottomNavigationBar: BottomNavigationBar( // Navegación inferior
      currentIndex: page, onTap: (i) => setState(() { page = i; exercise = 0; }), // Cambia página y resetea ejercicio
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.widgets), label: 'StatelessWidget'), // Página 0
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'StatefulWidget'), // Página 1
      ],
    ),
  );
}

// Ejercicio 2.1: Widget para cambiar saludos entre Morning y Night
class GreetingEx extends StatefulWidget {
  const GreetingEx({super.key});

  @override
  State<GreetingEx> createState() => _GreetingExState();
}
class _GreetingExState extends State<GreetingEx> {
  String greeting = 'Good ?!'; // Estado inicial del saludo
  @override
  Widget build(context) => Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
    Text(greeting, style: const TextStyle(fontSize: 24)), const SizedBox(height: 30), // Muestra saludo actual
    ElevatedButton(onPressed: () => setState(() => greeting = 'Good Morning!'), child: const Text('Morning')), // Botón Morning
    const SizedBox(height: 20), // Espaciado
    ElevatedButton(onPressed: () => setState(() => greeting = 'Good Night!'), child: const Text('Night')), // Botón Night
  ]));
}

// Ejercicio 2.2: Input de nombre que muestra saludo en AlertDialog
class NameEx extends StatefulWidget {
  const NameEx({super.key});

  @override
  State<NameEx> createState() => _NameExState();
}
class _NameExState extends State<NameEx> {
  final c = TextEditingController(); // Controlador para el TextField
  @override
  Widget build(context) => Padding(padding: const EdgeInsets.all(20), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
    TextField(controller: c, decoration: const InputDecoration(labelText: 'Tu nombre')), // Campo de entrada
    const SizedBox(height: 20), // Espaciado
    ElevatedButton(onPressed: () => showDialog(context: context, builder: (_) => AlertDialog( // Botón que abre diálogo
      title: const Text('Hola'), content: Text('Hola ${c.text}!'), // Título y mensaje personalizado
      actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK'))], // Botón cerrar
    )), child: const Text('Saludar')),
  ]));
}

// Ejercicio 2.3: Juego de adivinar número entre 0-100
class GuessEx extends StatefulWidget {
  const GuessEx({super.key});

  @override
  State<GuessEx> createState() => _GuessExState();
}
class _GuessExState extends State<GuessEx> {
  final c = TextEditingController(); // Controlador para entrada de número
  int secret = Random().nextInt(101); // Número secreto aleatorio (0-100)
  String msg = 'Adivina (0-100)'; // Mensaje de estado del juego
  
  check() { // Función para verificar la respuesta
    final guess = int.tryParse(c.text) ?? -1; // Convierte texto a número, -1 si falla
    setState(() => msg = guess < secret ? 'Más alto' : guess > secret ? 'Más bajo' : '¡Correcto!'); // Actualiza mensaje
  }
  
  @override
  Widget build(context) => Padding(padding: const EdgeInsets.all(20), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
    Text(msg, style: const TextStyle(fontSize: 18)), const SizedBox(height: 20), // Muestra mensaje actual
    TextField(controller: c, keyboardType: TextInputType.number), const SizedBox(height: 20), // Campo numérico
    ElevatedButton(onPressed: check, child: const Text('Comprobar')), // Botón verificar
  ]));
}

// Ejercicio 2.4: Simulador de dados con dos dados
class DiceEx extends StatefulWidget {
  const DiceEx({super.key});

  @override
  State<DiceEx> createState() => _DiceExState();
}
class _DiceExState extends State<DiceEx> {
  int d1 = 1, d2 = 1; // Valores de los dos dados
  
  roll() => setState(() { d1 = Random().nextInt(6) + 1; d2 = Random().nextInt(6) + 1; }); // Lanza dados (1-6)
  
  @override
  Widget build(context) => Container(color: Colors.black, child: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [ // Fondo negro
    Row(mainAxisAlignment: MainAxisAlignment.center, children: [ // Fila de dados
      Container(width: 80, height: 80, decoration: const BoxDecoration(color: Colors.white), // Dado 1 - cuadrado blanco
        child: Center(child: Text('$d1', style: const TextStyle(fontSize: 32)))), // Número del dado 1
      const SizedBox(width: 20), // Espaciado entre dados
      Container(width: 80, height: 80, decoration: const BoxDecoration(color: Colors.white), // Dado 2 - cuadrado blanco
        child: Center(child: Text('$d2', style: const TextStyle(fontSize: 32)))), // Número del dado 2
    ]),
    const SizedBox(height: 40), ElevatedButton(onPressed: roll, child: const Text('ROLL')), // Botón lanzar dados
  ])));
}

// Ejercicio 2.5: Contador doble para dos jugadores
class CounterEx extends StatefulWidget {
  const CounterEx({super.key});

  @override
  State<CounterEx> createState() => _CounterExState();
}
class _CounterExState extends State<CounterEx> {
  int c1 = 0, c2 = 0; // Contadores de jugador 1 y 2
  
  @override
  Widget build(context) => Center(child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [ // Row centrada con espacio uniforme
    Column(mainAxisAlignment: MainAxisAlignment.center, children: [ // Columna jugador 1
      Text('$c1', style: const TextStyle(fontSize: 48)), // Contador 1 (tamaño grande)
      ElevatedButton(onPressed: () => setState(() => c1++), child: const Text('Score 1')), // Botón incrementar 1
    ]),
    Column(mainAxisAlignment: MainAxisAlignment.center, children: [ // Columna jugador 2
      Text('$c2', style: const TextStyle(fontSize: 48)), // Contador 2 (tamaño grande)
      ElevatedButton(onPressed: () => setState(() => c2++), child: const Text('Score 2')), // Botón incrementar 2
    ]),
  ]));
}

// Ejercicio 2.6: Lista de compras con agregar/eliminar productos
class ShopEx extends StatefulWidget {
  const ShopEx({super.key});

  @override
  State<ShopEx> createState() => _ShopExState();
}
class _ShopExState extends State<ShopEx> {
  final name = TextEditingController(), qty = TextEditingController(); // Controladores para producto y cantidad
  final items = <Map<String, String>>[]; // Lista de productos (Map con name y qty)
  
  add() { // Función para añadir producto
    if (name.text.isNotEmpty && qty.text.isNotEmpty) { // Validación campos no vacíos
      setState(() => items.add({'name': name.text, 'qty': qty.text})); // Agrega producto a la lista
      name.clear(); qty.clear(); // Limpia campos de entrada
    }
  }
  
  @override
  Widget build(context) => Padding(padding: const EdgeInsets.all(20), child: Column(children: [ // Padding y Column principal
    TextField(controller: name, decoration: const InputDecoration(labelText: 'Producto')), // Campo nombre producto
    const SizedBox(height: 10), // Espaciado
    TextField(controller: qty, decoration: const InputDecoration(labelText: 'Cantidad')), // Campo cantidad
    const SizedBox(height: 20), ElevatedButton(onPressed: add, child: const Text('Añadir')), const SizedBox(height: 20), // Botón añadir
    Expanded(child: ListView.builder(itemCount: items.length, itemBuilder: (_, i) => ListTile( // Lista expandida de productos
      title: Text(items[i]['name']!), subtitle: Text('Cantidad: ${items[i]['qty']}'), // Título y subtítulo del producto
      trailing: IconButton(icon: const Icon(Icons.delete), onPressed: () => setState(() => items.removeAt(i))), // Botón eliminar
    ))),
  ]));
}

// Ejercicio 2.7: Ejemplo Provider simplificado (sin dependencia externa)
class ProviderEx extends StatefulWidget {
  const ProviderEx({super.key});

  @override
  State<ProviderEx> createState() => _ProviderExState();
}

class _ProviderExState extends State<ProviderEx> {
  int count = 0; // Contador simple que simula el estado de un Provider
  
  @override
  Widget build(context) => Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [ // Column centrada
    const Text('Provider Example (Simplified)', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)), // Título
    const SizedBox(height: 20), // Espaciado
    Text('Contador: $count', style: const TextStyle(fontSize: 24)), // Muestra valor contador
    const SizedBox(height: 30), // Espaciado
    ElevatedButton(onPressed: () => setState(() => count++), child: const Text('Incrementar')), // Botón +1
    const SizedBox(height: 20), // Espaciado
    ElevatedButton(onPressed: () => setState(() => count > 0 ? count-- : null), child: const Text('Decrementar')), // Botón -1 (no baja de 0)
  ]));
}
