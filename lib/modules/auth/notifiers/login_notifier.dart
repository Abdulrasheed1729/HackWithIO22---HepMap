import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hack_with_io/modules/auth/auth.dart';
import 'package:hack_with_io/modules/auth/states/states.dart';

class LoginNotifier extends StateNotifier<LoginState> {
  LoginNotifier(this.ref) : super(LoginState.initial());

  final Ref ref;

  void togglePasswordVisibility() =>
      state = state.copyWith(passwordVisible: !state.passwordVisible);

  Future<void> login({
    required String email,
    required String password,
  }) async {
    state = state.copyWith(viewState: ViewState.loading);
    try {
      await ref.read(authRepositoryProvider).loginWithEmailAndPassword(
            email: email.trim(),
            password: password,
          );
    } on LogInWithEmailAndPasswordFailure catch (_) {}
  }
}

final loginNotifierProvider = StateNotifierProvider<LoginNotifier, LoginState>(
  (ref) => LoginNotifier(ref),
);
