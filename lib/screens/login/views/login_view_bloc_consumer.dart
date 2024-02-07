import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_finder_app/cubits/login_cubit/login_cubit.dart';
import 'package:job_finder_app/screens/home/views/home_view.dart';

import '../widgets/login_view_body.dart';

class LoginViewBlocConsumer extends StatelessWidget {
  const LoginViewBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Success')));
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return  const HomeView();
            },
          ));
        }
        if (state is LoginFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errMessage)));
        }
      },
      builder: (context, state) {
        return const LoginViewBody();
      },
    );
  }
}
