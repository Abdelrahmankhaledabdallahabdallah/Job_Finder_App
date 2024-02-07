import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_finder_app/cubits/register_cubit/register_cubit.dart';
import 'package:job_finder_app/screens/register/widgets/register_view_body_bloc_consumer.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  static const String id = 'register_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: const SafeArea(
          child: RegisterViewBodyBlocConsumer(),
        ),
      ),
    );
  }
}
