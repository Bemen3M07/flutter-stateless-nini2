import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('This is a resource string'),
              const SizedBox(height: 16),
              // Image from assets. If the file is not present, the errorBuilder
              // will render a placeholder icon instead of throwing.
              Image.asset(
                'assets/numero1.png',
                width: 200,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.broken_image, size: 64),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
