import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:motocare/features/auth/presentation/providers/auth_provider.dart';

final logoutProvider = FutureProvider.autoDispose<void>((ref) async {
  final repo = ref.read(authRepositoryProvider);
  try {
    await repo.logout();
  } catch (e) {
    throw Exception('Error al cerrar sesión: $e');
  }
});
