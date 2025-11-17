import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => MainAppState();
}

class MainAppState extends State<MainApp> {
  final Random random = Random();

  int dice1 = 1;
  int dice2 = 1;

  void rollDice() {
    setState(() {
      dice1 = random.nextInt(6) + 1;
      dice2 = random.nextInt(6) + 1;
    });

    // Jackpot: dos sisos
    if (dice1 == 6 && dice2 == 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("JACKPOT!"),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF1A1A1A),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/dice_$dice1.svg", width: 120),
                  const SizedBox(width: 20),
                  SvgPicture.asset("assets/dice_$dice2.svg", width: 120),
                ],
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: rollDice,
                child: const Text("ROLL THE DICE"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
