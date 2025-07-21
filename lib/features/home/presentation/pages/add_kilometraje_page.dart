import 'package:flutter/material.dart';

class AddKilometrajePage extends StatefulWidget {
  const AddKilometrajePage({super.key});

  @override
  State<AddKilometrajePage> createState() => _AddKilometrajePageState();
}

class _AddKilometrajePageState extends State<AddKilometrajePage> {
  final TextEditingController _kilometrajeController = TextEditingController();
  String? _fluidoSeleccionado;
  String? _tipoAceite;

  final List<String> fluidos = ['Aceite', 'Frenos', 'Refrigerante'];
  final List<String> tiposAceite = ['Mineral', 'Semisintético', 'Sintético'];

  @override
  void dispose() {
    _kilometrajeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Agregar Kilometraje', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Kilometraje actual',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _kilometrajeController,
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[900],
                hintText: 'Ej. 12500',
                hintStyle: const TextStyle(color: Colors.white54),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              '¿Registraste algún cambio?',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: _fluidoSeleccionado,
              dropdownColor: Colors.grey[900],
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[900],
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
              hint: const Text('Seleccionar fluido', style: TextStyle(color: Colors.white54)),
              style: const TextStyle(color: Colors.white),
              items: fluidos.map((fluido) {
                return DropdownMenuItem<String>(
                  value: fluido,
                  child: Text(fluido),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _fluidoSeleccionado = value;
                  _tipoAceite = null;
                });
              },
            ),
            if (_fluidoSeleccionado == 'Aceite') ...[
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: _tipoAceite,
                dropdownColor: Colors.grey[900],
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[900],
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
                hint: const Text('Tipo de aceite', style: TextStyle(color: Colors.white54)),
                style: const TextStyle(color: Colors.white),
                items: tiposAceite.map((tipo) {
                  return DropdownMenuItem<String>(
                    value: tipo,
                    child: Text(tipo),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _tipoAceite = value;
                  });
                },
              ),
            ],
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // lógica de guardado (más adelante)
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Kilometraje registrado'),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                child: const Text(
                  'Guardar',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
