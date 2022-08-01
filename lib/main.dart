import 'package:auth_repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack_with_io/app/app.dart';

Future<void> main() {
  return BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      // await Firebase.initializeApp();
      final authRepository = AuthRepository();
      await authRepository.user.first;
      runApp(
        App(
          authRepository: authRepository,
        ),
      );
    },
    blocObserver: AppBlocObserver(),
  );
}
