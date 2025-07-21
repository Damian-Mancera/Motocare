import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:motocare/core/widgets/custom_button.dart';
import 'package:motocare/core/widgets/logo_widget.dart';
import 'package:motocare/features/auth/presentation/controllers/register_controller.dart';
import 'package:motocare/core/utils/snackbar_utils.dart';


class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      final controller = RegisterController(ref);

      try {
        await controller.register(
          _nameController.text.trim(),
          _emailController.text.trim(),
          _passwordController.text.trim(),
        );
        if (context.mounted) {
          showSuccessSnackBar(context, 'Registro exitoso');
          Navigator.of(context).pop(); // o navega a Home
        }
      } catch (e) {
        showErrorSnackBar(context, e.toString());
      } finally {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LogoWidget(), // widget reutilizable con el logo en top-left
              const SizedBox(height: 32),
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
              const SizedBox(height: 32),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    _buildTextField(_nameController, 'Nombre completo'),
                    const SizedBox(height: 16),
                    _buildTextField(_emailController, 'Correo electrónico'),
                    const SizedBox(height: 16),
                    _buildTextField(_passwordController, 'Contraseña', isPassword: true),
                    const SizedBox(height: 32),
                    CustomButton(
                      text: _isLoading ? 'Registrando...' : 'Registrarse',
                      onPressed: _isLoading ? null : _register,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, {bool isPassword = false}) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white70),
        filled: true,
        fillColor: Colors.grey[900],
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Este campo es obligatorio';
        }
        return null;
      },
    );
  }
}
