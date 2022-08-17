import 'package:flutter/material.dart';
import 'package:hack_with_io/modules/user_record/services/storage/storage.dart';
import 'package:hack_with_io/modules/modules.dart';

class App extends StatelessWidget {
  final UserLocalStorageApi _userStorage;
  const App({
    required UserLocalStorageApi userStorage,
    Key? key,
    // required AuthRepository authRepository,
  })  : _userStorage = userStorage,
        //  _authRepository = authRepository,
        super(key: key);

  // final AuthRepository _authRepository;

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: HomeView()),
    );
  }
}
