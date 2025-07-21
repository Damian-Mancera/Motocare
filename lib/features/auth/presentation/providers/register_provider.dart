import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:motocare/features/auth/data/datasources/auth_datasource_impl.dart';
import 'package:motocare/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:motocare/features/auth/domain/usecases/register_user.dart';

final registerUserProvider = Provider<RegisterUser>((ref) {
  final datasource = AuthDatasourceImpl(FirebaseAuth.instance);
  final repository = AuthRepositoryImpl(datasource);
  return RegisterUser(repository);
});
