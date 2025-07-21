import 'package:flutter/material.dart';

class MaintenanceHistoryPage extends StatelessWidget {
  const MaintenanceHistoryPage({super.key});

  // Datos simulados (luego los reemplazamos con los de SQLite)
  final List<Map<String, String>> historial = const [
    {
      'moto': 'Pulsar NS 200',
      'fluido': 'Aceite',
      'tipo': 'Sintético',
      'km': '12500',
      'fecha': '2025-07-10',
    },
    {
      'moto': 'Pulsar NS 200',
      'fluido': 'Refrigerante',
      'tipo': '-',
      'km': '12000',
      'fecha': '2025-06-20',
    },
    {
      'moto': 'Honda CBF 150',
      'fluido': 'Frenos',
      'tipo': '-',
      'km': '9500',
      'fecha': '2025-06-01',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Historial de Mantenimientos', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: historial.length,
        itemBuilder: (context, index) {
          final item = historial[index];
          return Card(
            color: Colors.grey[900],
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            margin: const EdgeInsets.only(bottom: 16),
            child: ListTile(
              title: Text(
                '${item['fluido']} (${item['tipo']})',
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Moto: ${item['moto']}', style: const TextStyle(color: Colors.white70)),
                  Text('Kilometraje: ${item['km']} km', style: const TextStyle(color: Colors.white70)),
                  Text('Fecha: ${item['fecha']}', style: const TextStyle(color: Colors.white54)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
