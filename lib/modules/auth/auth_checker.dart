import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hack_with_io/modules/auth/auth.dart';
import 'package:hack_with_io/modules/home/home.dart';

class AuthChecker extends ConsumerWidget {
  const AuthChecker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateChangeProvider);
    return authState.when(
      data: (user) => user != null ? const HomePage() : const SignInScreen(),
      error: (e, _) => const SignInScreen(),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
