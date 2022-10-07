import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hack_with_io/modules/auth/auth.dart';

import '../states/states.dart';

class SignUpNotifier extends StateNotifier<SignUpState> {
  SignUpNotifier(this.ref) : super(SignUpState.initial());

  final Ref ref;

  void togglePasswordVisibility() =>
      state = state.copyWith(passwordVisible: !state.passwordVisible);

  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    state = state.copyWith(viewState: ViewState.loading);
    try {
      await ref.read(authRepositoryProvider).signUp(
            email: email.trim(),
            password: password,
          );
    } on SignUpWithEmailAndPasswordFailure catch (_) {}
  }
}

final signUpNotifierProvider =
    StateNotifierProvider<SignUpNotifier, SignUpState>(
  (ref) => SignUpNotifier(ref),
);
