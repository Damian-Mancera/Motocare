import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) => AuthController());

class AuthController extends StateNotifier<bool> {
  AuthController() : super(false);

  Future<bool> register({required String name, required String email, required String password}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Puedes guardar `name` en Firestore luego.
      return true;
    } catch (e) {
      print("Error en registro: $e");
      return false;
    }
  }
}
