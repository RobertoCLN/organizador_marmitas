import 'package:flutter/material.dart';
import '../models/marmita.dart';

class Estatisticas extends StatelessWidget {
  final List<Marmita> marmitas;

  const Estatisticas({super.key, required this.marmitas});

  @override
  Widget build(BuildContext context) {
    int totalMarmitas = marmitas.length;
    int consumidas = marmitas.where((m) => m.consumida).length;
    int restantes = totalMarmitas - consumidas;
    double progresso = totalMarmitas == 0 ? 0.0 : consumidas / totalMarmitas;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Progresso da Semana',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),

          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 150,
                height: 150,
                child: CircularProgressIndicator(
                  value: progresso,
                  strokeWidth: 12,
                  backgroundColor: Colors.grey[300],
                  color: Colors.deepOrange,
                ),
              ),

              Text(
                '${(progresso * 100).toInt()}%',
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 40),

          Text(
            'Total de Marmitas: $totalMarmitas',
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 10),
          Text(
            'Consumidas: $consumidas',
            style: const TextStyle(fontSize: 18, color: Colors.green),
          ),
          const SizedBox(height: 10),
          Text(
            'Restantes: $restantes',
            style: const TextStyle(fontSize: 18, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
