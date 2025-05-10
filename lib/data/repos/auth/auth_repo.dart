import 'package:app/data/models/auth_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth;

  AuthRepository({FirebaseAuth? firebaseAuth})
    : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  // login
  Future<AuthUser> login({
    required String email,
    required String password,
  }) async {
    final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = userCredential.user!;
    return AuthUser(uid: user.uid, email: user.email!);
  }

  // register
  Future<AuthUser> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = userCredential.user!;
    await user.updateDisplayName(name);
    return AuthUser(uid: user.uid, email: user.email!);
  }

  // Add other methods (register, reset password, etc.) as needed
}
