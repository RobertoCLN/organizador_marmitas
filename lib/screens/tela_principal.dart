import 'package:flutter/material.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  // Índice da aba atualmente selecionada
  int _indiceAtual = 0;

  final List<Widget> _telas = [
    const Center(child: Text('Lista de Marmitas')),
    const Center(child: Text('Estatísticas')),
  ];

  void _aoMudarAba(int indice) {
    setState(() {
      _indiceAtual = indice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MealPrep - Minhas Marmitas'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: _telas[_indiceAtual],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: _aoMudarAba,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.lunch_dining),
            label: 'Marmitas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Estatísticas',
          ),
        ],
      ),
    );
  }
}
