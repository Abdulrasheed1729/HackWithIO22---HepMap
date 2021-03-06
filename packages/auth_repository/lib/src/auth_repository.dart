import 'models/models.dart';

abstract class AuthRepository {
  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });
}
