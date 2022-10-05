import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:hack_with_io/modules/auth/auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  StreamSubscription<firebase_auth.User?>? _userSubscription;

  AuthBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const AuthState.unknown()) {
    _userSubscription = _authRepository.user.listen(
      (user) => add(
        AuthUserChanged(user: user!),
      ),
    );

    on<AuthUserChanged>(_onAuthUserChanged);
  }

  FutureOr<void> _onAuthUserChanged(
      AuthUserChanged event, Emitter<AuthState> emit) {
    emit(AuthState.authenticated(user: event.user));
  }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }
}
