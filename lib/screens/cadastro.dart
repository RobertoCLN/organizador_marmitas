import 'package:flutter/material.dart';
import "../models/marmita.dart";

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final TextEditingController _nomeController = TextEditingController();

  String _tipoSelecionado = 'Frango'; //Valor padrão
  bool _congelada = false;

  void _salvarMarmita() {
    //validar nome não vazio
    if (_nomeController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, insira um nome para a marmita.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    //Criar objeto Marmita
    // o DataTime.now() como ID provisório, para garantir que seja único
    final novaMarmita = Marmita(
      id: DateTime.now().toString(),
      nome: _nomeController.text,
      tipo: _tipoSelecionado,
      congelada: _congelada,
      consumida: false,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Marmita salva com sucesso!'),
        backgroundColor: Colors.green,
      ),
    );

    //fecha a tela de cadastro e retorna a nova marmita para a tela principal
    Navigator.pop(context, novaMarmita);
  }

  // limpar os controllers quando a tela for fechada
  @override
  void dispose() {
    _nomeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar Marmita'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome da Marmita',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            const Text('Tipo de Marmita:', style: TextStyle(fontSize: 16)),

            RadioListTile<String>(
              title: const Text('Frango'),
              value: 'Frango',
              groupValue: _tipoSelecionado,
              onChanged: (String? valor) {
                setState(() {
                  _tipoSelecionado = valor!;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('Carne'),
              value: 'Carne',
              groupValue: _tipoSelecionado,
              onChanged: (String? valor) {
                setState(() {
                  _tipoSelecionado = valor!;
                });
              },
            ),

            const Divider(),

            CheckboxListTile(
              title: const Text('Já está congelada?'),
              value: _congelada,
              onChanged: (bool? valor) {
                setState(() {
                  _congelada = valor!;
                });
              },
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: _salvarMarmita,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                'SALVAR MARMITA',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
