import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController qtyController = TextEditingController();

  List<Map<String, String>> items = [];

  void addItem() {
    final name = nameController.text.trim();
    final qty = qtyController.text.trim();

    if (name.isEmpty || qty.isEmpty) return;

    setState(() {
      items.add({'name': name, 'qty': qty});
    });

    nameController.clear();
    qtyController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Shopping List"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Product name",
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: qtyController,
                decoration: const InputDecoration(
                  labelText: "Quantity",
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: addItem,
                child: const Text("Add item"),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(items[index]['name']!),
                      subtitle: Text("Quantity: ${items[index]['qty']}"),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
