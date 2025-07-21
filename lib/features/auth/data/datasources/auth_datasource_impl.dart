import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'auth_datasource.dart';

class AuthDatasourceImpl implements AuthDatasource {
  final FirebaseAuth firebaseAuth;

  AuthDatasourceImpl(this.firebaseAuth);

  @override
  Future<void> registerUser(String name, String email, String password) async {
    final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = userCredential.user;

    if (user != null) {
      // Actualiza el nombre visible
      await user.updateDisplayName(name);
      await user.reload();

      // Guarda los datos en Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .set({
        'uid': user.uid,
        'name': name,
        'email': email,
        'createdAt': FieldValue.serverTimestamp(),
      });
    }
  }

  @override
  Future<void> loginUser(String email, String password) {
    return firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> logout() {
    return firebaseAuth.signOut();
  }

  @override
  Stream<User?> authStateChanges() {
    return firebaseAuth.authStateChanges();
  }
}
