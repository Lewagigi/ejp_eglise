import 'package:flutter/material.dart';

class MinisteresPage extends StatelessWidget {
  const MinisteresPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Exemple de liste de ministères
    final List<String> ministeres = [
      "Ministère de Louange",
      "Ministère de la Jeunesse",
      "Ministère de la Prière",
      "Ministère de l'Évangélisation",
      "Ministère Technique",
      "Ministère des Finances",
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Différents Ministères")),
      body: ListView.builder(
        itemCount: ministeres.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.account_balance),
            title: Text(ministeres[index]),
          );
        },
      ),
    );
  }
}
