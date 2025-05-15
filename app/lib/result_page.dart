import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final double imc;

  const ResultPage({super.key, required this.imc});

  String get classificacao {
    if (imc < 18.5) return "Abaixo do peso";
    if (imc < 24.9) return "Normal";
    if (imc < 29.9) return "Sobrepeso";
    if (imc < 39.9) return "Obesidade";
    return "Obesidade grave";
  }

  Color get corClassificacao {
    if (imc < 18.5) return Colors.orange;
    if (imc < 24.9) return Colors.green;
    if (imc < 29.9) return Colors.amber;
    if (imc < 39.9) return Colors.deepOrange;
    return Colors.red;
  }

  String get mensagem {
    switch (classificacao) {
      case "Abaixo do peso":
        return "Seu IMC está abaixo do ideal. Que tal procurar um nutricionista?";
      case "Normal":
        return "Parabéns! Você está com o IMC normal.\n\nContinue assim!";
      case "Sobrepeso":
        return "Atenção! Tente melhorar seus hábitos para alcançar um peso ideal.";
      case "Obesidade":
        return "É importante buscar acompanhamento médico e mudar o estilo de vida.";
      case "Obesidade grave":
        return "Cuide da sua saúde com urgência! Procure um especialista.";
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Resultado do IMC')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(color: corClassificacao, width: 3),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.health_and_safety, size: 60, color: Colors.grey),
                const SizedBox(height: 10),
                Text(imc.toStringAsFixed(1), style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                Text(
                  'Classificação: $classificacao',
                  style: TextStyle(fontSize: 18, color: corClassificacao),
                ),
                const SizedBox(height: 10),
                Text(
                  mensagem,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}