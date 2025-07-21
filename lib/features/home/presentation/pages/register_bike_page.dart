import 'package:flutter/material.dart';

class RegisterMotoPage extends StatefulWidget {
  const RegisterMotoPage({super.key});

  @override
  State<RegisterMotoPage> createState() => _RegisterMotoPageState();
}

class _RegisterMotoPageState extends State<RegisterMotoPage> {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _kilometrajeController = TextEditingController();
  String _tipoAceite = 'Mineral';
  bool _usaRefrigerante = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo
              Image.asset(
                'assets/logo_motocare.png.png',
                width: 100,
              ),
              const SizedBox(height: 20),

              const Text(
                'Registrar Moto',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              // Nombre
              TextField(
                controller: _nombreController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Nombre de la moto',
                  labelStyle: const TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.grey[900],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Tipo de aceite
              DropdownButtonFormField<String>(
                value: _tipoAceite,
                dropdownColor: Colors.grey[900],
                decoration: InputDecoration(
                  labelText: 'Tipo de aceite',
                  labelStyle: const TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.grey[900],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
                items: ['Mineral', 'Semisintético', 'Sintético']
                    .map((tipo) => DropdownMenuItem(
                          value: tipo,
                          child: Text(tipo),
                        ))
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _tipoAceite = value;
                    });
                  }
                },
              ),
              const SizedBox(height: 16),

              // Usa refrigerante
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '¿Usa refrigerante?',
                    style: TextStyle(color: Colors.white),
                  ),
                  Switch(
                    value: _usaRefrigerante,
                    activeColor: Colors.red,
                    onChanged: (value) {
                      setState(() {
                        _usaRefrigerante = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Kilometraje actual
              TextField(
                controller: _kilometrajeController,
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Kilometraje actual',
                  labelStyle: const TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.grey[900],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const Spacer(),

              // Botón Registrar
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    // TODO: Lógica de guardar moto
                  },
                  child: const Text(
                    'Registrar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
