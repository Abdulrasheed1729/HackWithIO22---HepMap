import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/view/app.dart';
import 'bloc_observer.dart';

Future<void> main() {
  return BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      // await Firebase.initializeApp();
      // final authRepository = AuthRepository();
      // await authRepository.user.first;
      runApp(
        const App(
            // authRepository: authRepository,
            ),
      );
    },
    blocObserver: AppBlocObserver(),
  );
}
