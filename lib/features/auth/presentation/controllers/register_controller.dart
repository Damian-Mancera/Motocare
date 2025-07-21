// import'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:motocare/features/auth/presentation/providers/register_provider.dart';

class RegisterController {
  final WidgetRef ref;

  RegisterController(this.ref);

  Future<void> register(String name, String email, String password) async {
    try {
      final registerUser = ref.read(registerUserProvider);
      await registerUser(name, email, password);
    } catch (e) {
      throw Exception('Error al registrar: $e');
    }
  }
}
