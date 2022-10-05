import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:hack_with_io/modules/auth/repository/base_auth_repository.dart';

class AuthRepository implements BaseAuthRepository {
  final firebase_auth.FirebaseAuth _firebaseAuth;
  AuthRepository({firebase_auth.FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;
  @override
  Future<firebase_auth.User?> signUp(
      {required String email, required String password}) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = credential.user;
      return user;
    } catch (_) {}
    return null;
  }

  @override
  Stream<firebase_auth.User?> get user => _firebaseAuth.userChanges();

  @override
  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (_) {}
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
