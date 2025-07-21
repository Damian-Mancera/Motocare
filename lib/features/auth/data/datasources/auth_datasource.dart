import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthDatasource {
  Future<void> registerUser(String name, String email, String password);
  Future<void> loginUser(String email, String password);
  Future<void> logout();
  Stream<User?> authStateChanges();
}
