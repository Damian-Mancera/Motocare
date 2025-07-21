import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/login_provider.dart';

final loginControllerProvider = FutureProvider.family<void, (String, String)>((ref, credentials) async {
  final loginUser = ref.read(loginUserProvider);
  await loginUser(credentials.$1, credentials.$2);
});
