import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource datasource;

  AuthRepositoryImpl(this.datasource);

  @override
  Future<void> registerUser(String name, String email, String password) {
    return datasource.registerUser(name, email, password);
  }

  @override
  Future<void> loginUser(String email, String password) {
    return datasource.loginUser(email, password);
  }

  @override
  Future<void> logout() {
    return datasource.logout();
  }

  @override
  Stream<User?> authStateChanges() {
    return datasource.authStateChanges();
  }
}
