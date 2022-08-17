import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hack_with_io/modules/user_record/services/storage/local_storage.dart';
import 'package:hack_with_io/modules/user_record/user_record.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hack_with_io/modules/modules.dart';
import 'package:path_provider/path_provider.dart';

import 'app/view/app.dart';
import 'bloc_observer.dart';

GetIt getIt = GetIt.I;
void main() async {
  getIt.registerSingleton<UserLocalStorageApi>(UserLocalStorageApi());
  final initializeLocalStorage = getIt.get<UserLocalStorageApi>();
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(UserAdapter());
  final document = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(document.path);
  await initializeLocalStorage.openBox();

  Bloc.observer = AppBlocObserver();
  // await Firebase.initializeApp();
  // final authRepository = AuthRepository();
  // await authRepository.user.first;
  runApp(
    App(
      userStorage: initializeLocalStorage,
      // authRepository: authRepository,
    ),
  );
}
