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
  int comptador1 = 0;
  int comptador2 = 0;
  void incrementarComptador1() {
    setState(() {
      comptador1++;
    });
  }

  void incrementarComptador2() {
    setState(() {
      comptador2++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$comptador1',
                  ),

                  ElevatedButton(
                    onPressed: incrementarComptador1,
                    child: const Text('Score'),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$comptador2',    
                  ),
                  ElevatedButton(
                    onPressed: incrementarComptador2,
                    child: const Text('Score'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}