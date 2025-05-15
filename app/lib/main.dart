import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(const ImcApp());
}

class ImcApp extends StatelessWidget {
  const ImcApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora IMC',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const HomePage(),
    );
  }
}