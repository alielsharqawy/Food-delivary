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
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user!;
      return AuthUser(
        uid: user.uid,
        email: user.email!,
        name: user.displayName ?? 'No Name',
      );
    } on FirebaseAuthException catch (e) {
      throw _getErrorMessage(e);
    } catch (_) {
      throw 'حدث خطأ غير متوقع. حاول مرة أخرى.';
    }
  }

  // register
 Future<AuthUser> register({
  required String name,
  required String email,
  required String password,
}) async {
  try {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = userCredential.user!;
    
    // Set the display name
    await user.updateDisplayName(name);

    // 🔁 Important: reload user data to reflect the new displayName
    await user.reload();
    final updatedUser = _firebaseAuth.currentUser!;

    return AuthUser(
      uid: updatedUser.uid,
      email: updatedUser.email!,
      name: updatedUser.displayName ?? 'No Name',
    );
  } on FirebaseAuthException catch (e) {
    throw _getErrorMessage(e);
  } catch (_) {
    throw 'حدث خطأ غير متوقع. حاول مرة أخرى.';
  }
}


  // Firebase error parser
  String _getErrorMessage(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return 'البريد الإلكتروني غير مسجل.';
      case 'wrong-password':
        return 'كلمة المرور غير صحيحة.';
      case 'email-already-in-use':
        return 'البريد الإلكتروني مستخدم بالفعل.';
      case 'weak-password':
        return 'كلمة المرور ضعيفة جدًا.';
      case 'invalid-email':
        return 'البريد الإلكتروني غير صالح.';
      case 'network-request-failed':
        return 'تأكد من اتصالك بالإنترنت.';
      default:
        return 'حدث خطأ: ${e.message}';
    }
  }
}


