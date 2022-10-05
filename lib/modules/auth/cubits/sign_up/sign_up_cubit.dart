import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repository/repository.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this._authRepository) : super(SignUpState.initial());

  final AuthRepository _authRepository;

  void emailChanged(String value) {
    emit(state.copyWith(email: value, status: SignupStatus.initial));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value, status: SignupStatus.initial));
  }

  void signupWithCredentials() async {
    if (!state.isValid) return;
    try {
      await _authRepository.signUp(
          email: state.email, password: state.password);

      emit(state.copyWith(status: SignupStatus.success));
    } catch (_) {}
  }
}
