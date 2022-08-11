import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'app/view/app.dart';
import 'bloc_observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  // await Firebase.initializeApp();
  // final authRepository = AuthRepository();
  // await authRepository.user.first;
  runApp(
    const App(
        // authRepository: authRepository,
        ),
  );
}
