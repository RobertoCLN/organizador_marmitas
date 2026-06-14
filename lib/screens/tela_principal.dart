import 'package:flutter/material.dart';
import 'cadastro.dart';
import '../models/marmita.dart';
import '../services/preferences_service.dart';
import 'estatisticas.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  int _indiceAtual = 0;

  // Instancia o serviço e cria a lista vazia
  final PreferencesService _preferencesService = PreferencesService();
  List<Marmita> _marmitas = [];

  // O initState é a primeira coisa que roda quando abre a tela
  @override
  void initState() {
    super.initState();
    _carregarMarmitas(); // Carrega as marmitas ao iniciar a tela
  }

  //Busca as marmitas salvas e atualiza a lista
  Future<void> _carregarMarmitas() async {
    final marmitasSalvas = await _preferencesService.carregarMarmitas();
    setState(() {
      _marmitas = marmitasSalvas;
    });
  }

  // Salva a lista toda vez que uma nova marmita é adicionada
  Future<void> _salvarMarmitas() async {
    await _preferencesService.salvarMarmitas(_marmitas);
  }

  void _aoMudarAba(int indice) {
    setState(() {
      _indiceAtual = indice;
    });
  }

  //metodo para construir a aba de marmitas
  Widget _construirAbaMarmitas() {
    if (_marmitas.isEmpty) {
      return const Center(child: Text('Nenhuma marmita cadastrada'));
    }

    return ListView.builder(
      itemCount: _marmitas.length,
      itemBuilder: (context, index) {
        final marmita = _marmitas[index];

        return Dismissible(
          key: Key(marmita.id),
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 20),
            child: const Icon(Icons.delete, color: Colors.white),
          ),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            setState(() {
              _marmitas.removeAt(index);
            });
            _salvarMarmitas();

            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('Marmita excluída')));
          },

          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              leading: Icon(
                marmita.tipo == 'Vegetariana' ? Icons.eco : Icons.kebab_dining,
                color: Colors.deepOrange,
              ),
              title: Text(
                marmita.nome,
                style: TextStyle(
                  decoration: marmita.consumida
                      ? TextDecoration.lineThrough
                      : null,
                ),
              ),
              subtitle: Text(
                '${marmita.tipo} ${marmita.congelada ? "(Congelada)" : ""}',
              ),
              trailing: Checkbox(
                value: marmita.consumida,
                onChanged: (bool? valor) {
                  setState(() {
                    marmita.consumida = valor!;
                  });
                  _salvarMarmitas();
                },
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MealPrep - Minhas marmitas'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      // mostra a lista se o indice for 0, senao mostra estatisticas
      body: _indiceAtual == 0
          ? _construirAbaMarmitas()
          : Estatisticas(marmitas: _marmitas),

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
      floatingActionButton: _indiceAtual == 0
          ? FloatingActionButton(
              onPressed: () async {
                final novaMarmita = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Cadastro()),
                );

                //Se voltou com uma marmita nova, adiciona na lista e salva
                if (novaMarmita != null) {
                  setState(() {
                    _marmitas.add(novaMarmita);
                  });
                  _salvarMarmitas(); // Chama o método que acessa o shared_preferences
                }
              },
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}
