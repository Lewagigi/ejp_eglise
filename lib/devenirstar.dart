import 'package:flutter/material.dart';

class NouvellePage extends StatefulWidget {
  const NouvellePage({super.key});

  @override
  State<NouvellePage> createState() => _NouvellePageState();
}

class _NouvellePageState extends State<NouvellePage> {
  // Clé pour le formulaire
  final _formKey = GlobalKey<FormState>();

  // Contrôleurs pour récupérer les valeurs
  final _nomController = TextEditingController();
  final _prenomController = TextEditingController();
  final _emailController = TextEditingController();
  final _telephoneController = TextEditingController();
  final _adresseController = TextEditingController();
  final _dateNaissanceController = TextEditingController();
  final _dateBaptemeController = TextEditingController();

  @override
  void dispose() {
    // On libère les ressources des contrôleurs
    _nomController.dispose();
    _prenomController.dispose();
    _emailController.dispose();
    _telephoneController.dispose();
    _adresseController.dispose();
    _dateNaissanceController.dispose();
    _dateBaptemeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.inversePrimary,
        title: const Text("Nouvelle Page"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildTextField(_nomController, "Nom"),
              _buildTextField(_prenomController, "Prénom"),
              _buildTextField(
                _emailController,
                "Email",
                keyboardType: TextInputType.emailAddress,
              ),
              _buildTextField(
                _telephoneController,
                "Téléphone",
                keyboardType: TextInputType.phone,
              ),
              _buildTextField(_adresseController, "Adresse"),
              _buildTextField(_dateNaissanceController, "Date de naissance ⚠️"),
              _buildTextField(_dateBaptemeController, "Date de baptême ⚠️"),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Ici tu peux traiter les données du formulaire
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Formulaire envoyé !')),
                    );
                  }
                },
                child: const Text("Envoyer"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Méthode pour créer facilement des TextFormField
  Widget _buildTextField(
    TextEditingController controller,
    String label, {
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Veuillez remplir ce champ';
          }
          return null;
        },
      ),
    );
  }
}
