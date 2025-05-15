import 'package:flutter/material.dart';
import 'result_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController alturaController = TextEditingController();
  final TextEditingController pesoController = TextEditingController();

  void calcularIMC() {
    final double? altura = double.tryParse(alturaController.text);
    final double? peso = double.tryParse(pesoController.text);

    if (altura != null && peso != null && altura > 0) {
      final double imc = peso / (altura * altura);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(imc: imc),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, insira valores válidos!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculadora IMC')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Icon(Icons.person, size: 100, color: Colors.green),
            TextField(
              controller: alturaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Altura (m)'),
            ),
            TextField(
              controller: pesoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Peso (kg)'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: calcularIMC,
              child: const Text('Calcular IMC'),
            ),
          ],
        ),
      ),
    );
  }
}