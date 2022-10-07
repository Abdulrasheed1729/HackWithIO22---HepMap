enum ViewState { idle, loading, error }

extension ViewStateExtension on ViewState {
  bool get isLoading => this == ViewState.loading;
  bool get isIdle => this == ViewState.idle;
  bool get isError => this == ViewState.error;
}

class LoginState {
  final ViewState viewState;
  final bool passwordVisible;

  LoginState._({required this.viewState, required this.passwordVisible});

  factory LoginState.initial() => LoginState._(
        viewState: ViewState.idle,
        passwordVisible: false,
      );

  LoginState copyWith({ViewState? viewState, bool? passwordVisible}) =>
      LoginState._(
        viewState: viewState ?? this.viewState,
        passwordVisible: passwordVisible ?? this.passwordVisible,
      );
}
