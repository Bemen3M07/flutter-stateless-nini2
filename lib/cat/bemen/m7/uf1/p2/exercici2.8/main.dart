import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MaterialApp(home: ExerciseApp(), debugShowCheckedModeBanner: false));

class ExerciseApp extends StatefulWidget {
  const ExerciseApp({super.key});

  @override
  State<ExerciseApp> createState() => _ExerciseAppState();
}

class _ExerciseAppState extends State<ExerciseApp> {
  int page = 0, exercise = 0;

  // All exercises in one place
  final exercises = [
    // StatelessWidget exercises
    [
      () => const Center(child: Text('Hello World!', style: TextStyle(fontSize: 24))),
      () => const Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('Welcome!', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
        SizedBox(height: 10), Text('Start learning now'), SizedBox(height: 20),
        ElevatedButton(onPressed: null, child: Text('Login')),
        TextButton(onPressed: null, child: Text('Register')),
      ])),
      () => const Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
        Text('This is a resource string'), SizedBox(height: 16), Icon(Icons.image, size: 100)
      ])),
      () => const Padding(padding: EdgeInsets.all(20), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Nom: Marta Casserres', style: TextStyle(fontSize: 18)), SizedBox(height: 10),
        Text('Email: marta@example.com', style: TextStyle(fontSize: 18)), SizedBox(height: 10),
        Text('Telèfon: 934748474', style: TextStyle(fontSize: 18)),
      ])),
      () => ListView.builder(itemCount: 20, itemBuilder: (c, i) {
        final names = ["Ana", "Juan", "María", "Pedro", "Luis"];
        return Card(margin: const EdgeInsets.all(8), child: ListTile(
          leading: CircleAvatar(child: Text(names[i % 5][0])),
          title: Text(names[i % 5]), subtitle: const Text('Lorem ipsum dolor sit amet'),
        ));
      }),
      () => Column(children: [
        Container(padding: const EdgeInsets.all(16), color: Colors.blue.shade50, width: double.infinity,
          child: const Text('Advanced List', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        Expanded(child: ListView.builder(itemCount: 15, itemBuilder: (c, i) => 
          ListTile(leading: CircleAvatar(child: Text('${i+1}')), title: Text('Item $i')))),
      ]),
    ],
    // StatefulWidget exercises  
    [
      () => GreetingEx(), () => NameEx(), () => GuessEx(), () => DiceEx(), () => CounterEx(), () => ShopEx(), () => ProviderEx(),
    ],
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(page == 0 ? 'StatelessWidgets' : 'StatefulWidgets'),
      backgroundColor: page == 0 ? Colors.blue : Colors.green, foregroundColor: Colors.white,
      actions: [PopupMenuButton<int>(
        onSelected: (i) => setState(() => exercise = i),
        itemBuilder: (_) => List.generate(7, (i) => PopupMenuItem(value: i, child: Text('Ejercicio ${i+1}'))),
      )],
    ),
    body: exercises[page][exercise](),
    bottomNavigationBar: BottomNavigationBar(
      currentIndex: page, onTap: (i) => setState(() { page = i; exercise = 0; }),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.widgets), label: 'StatelessWidget'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'StatefulWidget'),
      ],
    ),
  );
}

class GreetingEx extends StatefulWidget {
  const GreetingEx({super.key});

  @override
  State<GreetingEx> createState() => _GreetingExState();
}
class _GreetingExState extends State<GreetingEx> {
  String greeting = 'Good ?!';
  @override
  Widget build(context) => Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
    Text(greeting, style: const TextStyle(fontSize: 24)), const SizedBox(height: 30),
    ElevatedButton(onPressed: () => setState(() => greeting = 'Good Morning!'), child: const Text('Morning')),
    const SizedBox(height: 20),
    ElevatedButton(onPressed: () => setState(() => greeting = 'Good Night!'), child: const Text('Night')),
  ]));
}

class NameEx extends StatefulWidget {
  const NameEx({super.key});

  @override
  State<NameEx> createState() => _NameExState();
}
class _NameExState extends State<NameEx> {
  final c = TextEditingController();
  @override
  Widget build(context) => Padding(padding: const EdgeInsets.all(20), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
    TextField(controller: c, decoration: const InputDecoration(labelText: 'Tu nombre')),
    const SizedBox(height: 20),
    ElevatedButton(onPressed: () => showDialog(context: context, builder: (_) => AlertDialog(
      title: const Text('Hola'), content: Text('Hola ${c.text}!'),
      actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK'))],
    )), child: const Text('Saludar')),
  ]));
}

class GuessEx extends StatefulWidget {
  const GuessEx({super.key});

  @override
  State<GuessEx> createState() => _GuessExState();
}
class _GuessExState extends State<GuessEx> {
  final c = TextEditingController();
  int secret = Random().nextInt(101);
  String msg = 'Adivina (0-100)';
  
  check() {
    final guess = int.tryParse(c.text) ?? -1;
    setState(() => msg = guess < secret ? 'Más alto' : guess > secret ? 'Más bajo' : '¡Correcto!');
  }
  
  @override
  Widget build(context) => Padding(padding: const EdgeInsets.all(20), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
    Text(msg, style: const TextStyle(fontSize: 18)), const SizedBox(height: 20),
    TextField(controller: c, keyboardType: TextInputType.number), const SizedBox(height: 20),
    ElevatedButton(onPressed: check, child: const Text('Comprobar')),
  ]));
}

class DiceEx extends StatefulWidget {
  const DiceEx({super.key});

  @override
  State<DiceEx> createState() => _DiceExState();
}
class _DiceExState extends State<DiceEx> {
  int d1 = 1, d2 = 1;
  
  roll() => setState(() { d1 = Random().nextInt(6) + 1; d2 = Random().nextInt(6) + 1; });
  
  @override
  Widget build(context) => Container(color: Colors.black, child: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(width: 80, height: 80, decoration: const BoxDecoration(color: Colors.white), 
        child: Center(child: Text('$d1', style: const TextStyle(fontSize: 32)))),
      const SizedBox(width: 20),
      Container(width: 80, height: 80, decoration: const BoxDecoration(color: Colors.white),
        child: Center(child: Text('$d2', style: const TextStyle(fontSize: 32)))),
    ]),
    const SizedBox(height: 40), ElevatedButton(onPressed: roll, child: const Text('ROLL')),
  ])));
}

class CounterEx extends StatefulWidget {
  const CounterEx({super.key});

  @override
  State<CounterEx> createState() => _CounterExState();
}
class _CounterExState extends State<CounterEx> {
  int c1 = 0, c2 = 0;
  
  @override
  Widget build(context) => Center(child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
    Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text('$c1', style: const TextStyle(fontSize: 48)),
      ElevatedButton(onPressed: () => setState(() => c1++), child: const Text('Score 1')),
    ]),
    Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text('$c2', style: const TextStyle(fontSize: 48)),
      ElevatedButton(onPressed: () => setState(() => c2++), child: const Text('Score 2')),
    ]),
  ]));
}

class ShopEx extends StatefulWidget {
  const ShopEx({super.key});

  @override
  State<ShopEx> createState() => _ShopExState();
}
class _ShopExState extends State<ShopEx> {
  final name = TextEditingController(), qty = TextEditingController();
  final items = <Map<String, String>>[];
  
  add() {
    if (name.text.isNotEmpty && qty.text.isNotEmpty) {
      setState(() => items.add({'name': name.text, 'qty': qty.text}));
      name.clear(); qty.clear();
    }
  }
  
  @override
  Widget build(context) => Padding(padding: const EdgeInsets.all(20), child: Column(children: [
    TextField(controller: name, decoration: const InputDecoration(labelText: 'Producto')),
    const SizedBox(height: 10),
    TextField(controller: qty, decoration: const InputDecoration(labelText: 'Cantidad')),
    const SizedBox(height: 20), ElevatedButton(onPressed: add, child: const Text('Añadir')), const SizedBox(height: 20),
    Expanded(child: ListView.builder(itemCount: items.length, itemBuilder: (_, i) => ListTile(
      title: Text(items[i]['name']!), subtitle: Text('Cantidad: ${items[i]['qty']}'),
      trailing: IconButton(icon: const Icon(Icons.delete), onPressed: () => setState(() => items.removeAt(i))),
    ))),
  ]));
}

class ProviderEx extends StatefulWidget {
  const ProviderEx({super.key});

  @override
  State<ProviderEx> createState() => _ProviderExState();
}

class _ProviderExState extends State<ProviderEx> {
  int count = 0;
  
  @override
  Widget build(context) => Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
    const Text('Provider Example (Simplified)', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    const SizedBox(height: 20),
    Text('Contador: $count', style: const TextStyle(fontSize: 24)),
    const SizedBox(height: 30),
    ElevatedButton(onPressed: () => setState(() => count++), child: const Text('Incrementar')),
    const SizedBox(height: 20),
    ElevatedButton(onPressed: () => setState(() => count > 0 ? count-- : null), child: const Text('Decrementar')),
  ]));
}
