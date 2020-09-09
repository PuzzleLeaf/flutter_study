import 'package:auto_route/auto_route.dart';
import 'package:domain_driven/application/auth/bloc/auth_bloc.dart';
import 'package:domain_driven/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, authState) {
        authState.map(
          initial: (e) {},
          authenticated: (_) => {
            print('test')
          },
          unauthenticated: (_) => ExtendedNavigator.of(context).replace(Routes.signInPage),
        );
      },
      child: Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
