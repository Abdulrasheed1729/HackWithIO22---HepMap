import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

abstract class BaseAuthRepository {
  Stream<firebase_auth.User?> get authStateChange;

  Future<firebase_auth.User?> signUp({
    required String email,
    required String password,
  });
  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<void> signOut();
}
