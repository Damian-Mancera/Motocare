import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../data/datasources/auth_datasource_impl.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/login_user.dart';

final authDatasourceProvider = Provider<AuthDatasourceImpl>((ref) {
  return AuthDatasourceImpl(FirebaseAuth.instance);
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final datasource = ref.watch(authDatasourceProvider);
  return AuthRepositoryImpl(datasource);
});

final authStateProvider = StreamProvider<User?>((ref) {
  return ref.watch(authRepositoryProvider).authStateChanges();
});

final loginUserProvider = Provider<LoginUser>((ref) {
  final repo = ref.watch(authRepositoryProvider);
  return LoginUser(repo);
});

final logoutProvider = FutureProvider.autoDispose<void>((ref) async {
  final repo = ref.read(authRepositoryProvider);
  await repo.logout();
});
