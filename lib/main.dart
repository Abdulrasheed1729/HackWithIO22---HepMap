import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hack_with_io/modules/modules.dart';
import 'package:path_provider/path_provider.dart';

import 'app/view/app.dart';
import 'bloc_observer.dart';

GetIt getIt = GetIt.I;
Future<void> main() async {
  getIt.registerSingleton<UserLocalStorageApi>(UserLocalStorageApi());
  final initializeLocalStorage = getIt.get<UserLocalStorageApi>();
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(UserAdapter());
  final document = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(document.path);
  await initializeLocalStorage.openBox();

  Bloc.observer = AppBlocObserver();
  await Firebase.initializeApp();
  // final authRepository = AuthRepository();
  // await authRepository.user.first;
  runApp(
    const App(
        // authRepository: authRepository,
        ),
  );
}
