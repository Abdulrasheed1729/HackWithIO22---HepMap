import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'app_bloc_observer.dart';
import 'repositories/auth_repository/auth_repository.dart';

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
