import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => MainAppState();
}

class MainAppState extends State<MainApp> {
  String greeting = 'Good ?!';

  void updateGreeting(String timeOfDay) {
    setState(() {
      greeting = 'Good $timeOfDay!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                greeting,
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => updateGreeting('Morning'),
                child: const Text('Morning'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => updateGreeting('Night'),
                child: const Text('Night'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
