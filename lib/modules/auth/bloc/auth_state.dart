part of 'auth_bloc.dart';

enum AuthStatus {
  unknown,
  authenticated,
  unauthenticated,
}

class AuthState extends Equatable {
  final AuthStatus status;
  final firebase_auth.User? user;

  const AuthState._({
    this.status = AuthStatus.unknown,
    this.user,
  });

  const AuthState.unknown() : this._();

  const AuthState.authenticated({required firebase_auth.User user})
      : this._(
          status: AuthStatus.authenticated,
          user: user,
        );

  const AuthState.unauthenticated({required firebase_auth.User user})
      : this._(
          status: AuthStatus.unauthenticated,
          user: user,
        );

  @override
  List<Object?> get props => [status, user];
}
