import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hack_with_io/modules/user_record/services/storage/local_storage.dart';
import 'package:hack_with_io/modules/user_record/user_record.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hack_with_io/modules/modules.dart';

import 'app/view/app.dart';
import 'bloc_observer.dart';

void main() async {
  final userStorage = UserStorageApi();
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await userStorage.init();
  Hive.registerAdapter(UserAdapter());
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
