import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome!',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text('Start learning now'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: null,
                child: Text('Login'),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: null,
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
