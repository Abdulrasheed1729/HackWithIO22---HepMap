import 'login_state.dart';

class SignUpState {
  final ViewState viewState;
  final bool passwordVisible;

  SignUpState._({required this.viewState, required this.passwordVisible});

  factory SignUpState.initial() => SignUpState._(
        viewState: ViewState.idle,
        passwordVisible: false,
      );

  SignUpState copyWith({ViewState? viewState, bool? passwordVisible}) =>
      SignUpState._(
        viewState: viewState ?? this.viewState,
        passwordVisible: passwordVisible ?? this.passwordVisible,
      );
}
