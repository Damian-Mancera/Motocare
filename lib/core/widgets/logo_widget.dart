import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Image.asset(
        'assets/logo_motocare.png.png', // asegúrate que esté bien el nombre
        height: 50,
      ),
    );
  }
}
