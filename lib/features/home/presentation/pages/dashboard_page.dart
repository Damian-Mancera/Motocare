import 'package:flutter/material.dart';
import 'package:motocare/features/home/presentation/pages/register_bike_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Simulamos que el usuario no ha registrado ninguna moto aún
    int motosRegistradas = 0;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Text(
              'Mis Motos',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            if (motosRegistradas == 0)
              Expanded(
                child: Center(
                  child: Text(
                    'Aún no has registrado ninguna moto',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ),
              )
            else
              Expanded(
                child: ListView.builder(
                  itemCount: motosRegistradas,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.grey[900],
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ListTile(
                        title: Text(
                          'Moto ${index + 1}',
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          'Último mantenimiento: -',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                    );
                  },
                ),
              ),
            if (motosRegistradas < 3)
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 16),
                  ),
                  onPressed: () {
                      Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterMotoPage(),
                    ),
                  );
                },
                  child: const Text(
                    'Registrar moto',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
