import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class Contact {
  final String fullName;
  final String email;
  final String phone;

  const Contact({
    required this.fullName,
    required this.email,
    required this.phone,
  });
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  final Contact contact = const Contact(
    fullName: 'Marta Casserres',
    email: 'marta@example.com',
    phone: '934748474',
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Contacte'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nom complet: ${contact.fullName}',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              Text(
                'Correu electrònic: ${contact.email}',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              Text(
                'Telèfon: ${contact.phone}',
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
