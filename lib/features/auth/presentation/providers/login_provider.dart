import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../data/datasources/auth_datasource_impl.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/usecases/login_user.dart';

final loginUserProvider = Provider<LoginUser>((ref) {
  final datasource = AuthDatasourceImpl(FirebaseAuth.instance);
  final repository = AuthRepositoryImpl(datasource);
  return LoginUser(repository);
});
