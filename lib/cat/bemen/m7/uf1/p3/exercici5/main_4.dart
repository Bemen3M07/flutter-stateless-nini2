import 'dart:math';
import 'package:flutter/material.dart';

class Message {
  final String author;
  final String body;

  Message(this.author, this.body);
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Message List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MessageListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MessageListScreen extends StatelessWidget {
  const MessageListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Llista de noms
    final names = [
      "Ellison Curry",
      "Briggs Willis",
      "Alexa Murphy",
      "Cameron Berry",
      "Annabelle Villarreal",
      "Nikolai Wiley",
      "Lauryn Morrow",
      "Kyree Hardy",
      "Wells Wilson",
      "Luna Foster",
      "Kayden Taylor",
      "Sofia Mann",
      "Nehemiah Randall",
      "Christina Gordon",
      "Karter Kramer",
      "Hanna Morales",
      "Megan Delarosa",
      "Osiris Johnson",
      "Emma Atkins",
      "Cason McKee",
      "Kori Walls",
      "Larry Shepherd",
    ];

    const body =
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In ac vestibulum nunc.";

    final random = Random();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Message List",
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenWidth = constraints.maxWidth;
          final isMobile = screenWidth < 600; // Detección básica

          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemBuilder: (context, index) {
              final author = names[random.nextInt(names.length)];
              final message = Message(author, body);

              return Center(
                child: SizedBox(
                  width: isMobile ? screenWidth * 0.95 : 500, // tamaño adaptable
                  child: Card(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.blue.shade200,
                          child: Text(
                            author[0],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        title: Text(
                          message.author,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Text(
                          message.body,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
