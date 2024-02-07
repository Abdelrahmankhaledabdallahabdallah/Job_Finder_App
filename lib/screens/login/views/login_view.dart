import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_finder_app/cubits/login_cubit/login_cubit.dart';

import 'login_view_bloc_consumer.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const String id = 'login_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BlocProvider(
        create: (context) => LoginCubit(),
        child: const LoginViewBlocConsumer(),
      )),
    );
  }
}
