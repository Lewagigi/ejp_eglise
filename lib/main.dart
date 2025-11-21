import 'package:flutter/material.dart';
import 'nouvelle_page.dart';
import 'ministeres_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
      ),
      home: const MyHomePage(title: 'BIENVENUE EGLISES DES JEUNES PRODIGES'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          title, // "Bienvenue eglises jeunes prodiges"
          style: theme.textTheme.headlineSmall!.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Spacer(flex: 1),
          // "AppBar" pour les annonces
          Container(
            width: double.infinity,
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Center(
              child: Text(
                "LES ANNONCES DE L'EGLISE DES JEUNES PRODIGES",
                style: theme.textTheme.headlineMedium!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 40),
          // Row pour les deux boutons côte à côte
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center, // Centre les boutons
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MinisteresPage(),
                    ),
                  );
                },
                child: const Text(
                  "Différents Ministères",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NouvellePage(),
                    ),
                  );
                },
                child: const Text(
                  "Identifiez-vous",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
