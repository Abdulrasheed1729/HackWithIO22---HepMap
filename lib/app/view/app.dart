import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack_with_io/modules/modules.dart';

import '../app.dart';

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
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (_) => AuthRepository(),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(
              authRepository: context.read<AuthRepository>(),
            ),
          )
        ],
        child: const AppView(),
      ),
    );
  }
}

List<Page> onGenerateAppViewPages(
  AuthStatus state,
  List<Page> pages,
) {
  switch (state) {
    case AuthStatus.authenticated:
      return [HomeView.page()];
    case AuthStatus.unauthenticated:
      return [SignInScreen.page()];
    case AuthStatus.unknown:
      return [SignInScreen.page()];
  }
}

class AppView extends StatelessWidget {
  const AppView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HepMap',
      home: FlowBuilder<AuthStatus>(
        state: context.select((AuthBloc bloc) => bloc.state.status),
        onGeneratePages: onGenerateAppViewPages,
      ),
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
