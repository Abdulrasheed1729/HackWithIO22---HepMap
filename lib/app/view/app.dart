import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack_with_io/app/bloc/enum.dart';
import 'package:hack_with_io/modules/modules.dart';

import '../app.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(key: key);

  final AuthRepository _authRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authRepository,
      child: BlocProvider(
        create: (_) => AppBloc(authRepository: _authRepository),
        child: const AppView(),
      ),
    );
  }
}

List<Page> onGenerateAppViewPages(
  AppStatus state,
  List<Page> pages,
) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomeView.page()];
    case AppStatus.unauthenticated:
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
      home: FlowBuilder<AppStatus>(
        state: context.select((AppBloc bloc) => bloc.state.appStatus),
        onGeneratePages: onGenerateAppViewPages,
      ),
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
