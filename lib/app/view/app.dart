import 'package:auth_repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack_with_io/auth/bloc/auth_bloc.dart';
import 'package:hack_with_io/auth/views/sign_in.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(
          authRepository:
              FirebaseAuthRepository(authRepository: FirebaseAuth.instance)),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SignInScreen(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
