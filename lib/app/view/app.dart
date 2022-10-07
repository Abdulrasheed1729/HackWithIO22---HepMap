import 'package:flutter/material.dart';
import 'package:hack_with_io/modules/auth/auth_checker.dart';

import '../app.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AppView();
  }
}

// List<Page> onGenerateAppViewPages(
//   AuthStatus state,
//   List<Page> pages,
// ) {
//   switch (state) {
//     case AuthStatus.authenticated:
//       return [HomeView.page()];
//     case AuthStatus.unauthenticated:
//       return [SignInScreen.page()];
//     case AuthStatus.unknown:
//       return [SignInScreen.page()];
//   }
// }

class AppView extends StatelessWidget {
  const AppView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HepMap',
      home: AuthChecker(),
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
