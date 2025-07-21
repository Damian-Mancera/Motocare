import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:motocare/core/widgets/custom_button.dart';
import '../controllers/login_controller.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo superior
              Image.asset(
                'assets/logo_motocare.png.png',
                height: 50,
              ),
              const SizedBox(height: 40),
              const Center(
                child: Text(
                  'Bienvenido',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              TextField(
                controller: emailController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Correo electrónico',
                  labelStyle: TextStyle(color: Colors.grey),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: passwordController,
                obscureText: true,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Contraseña',
                  labelStyle: TextStyle(color: Colors.grey),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              if (errorMessage != null)
                Text(
                  errorMessage!,
                  style: const TextStyle(color: Colors.red),
                ),

              if (isLoading)
                const Center(child: CircularProgressIndicator())
              else
                Center(
                  child: CustomButton(
                    text: 'Iniciar sesión',
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                        errorMessage = null;
                      });

                      final email = emailController.text.trim();
                      final password = passwordController.text.trim();

                      try {
                        await ref
                            .read(loginControllerProvider((email, password))
                                .future);

                        if (!mounted) return;
                        Navigator.pushReplacementNamed(context, '/home');
                      } catch (e) {
                        setState(() {
                          errorMessage = 'Credenciales incorrectas';
                        });
                      } finally {
                        setState(() {
                          isLoading = false;
                        });
                      }
                    },
                  ),
                ),
              const SizedBox(height: 20),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/register');
                  },
                  child: const Text(
                    '¿No tienes cuenta? Regístrate',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
