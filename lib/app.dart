import 'package:flutter/material.dart';

import 'screens/screens.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    // required AuthRepository authRepository,
  }) :
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
