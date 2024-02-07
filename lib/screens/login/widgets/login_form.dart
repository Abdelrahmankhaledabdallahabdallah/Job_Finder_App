// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_finder_app/custom_widgets/custom_textfield.dart';
import 'package:job_finder_app/utils/app_images.dart';
import 'package:job_finder_app/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../cubits/login_cubit/login_cubit.dart';
import '../../../custom_widgets/auth_authentication_option.dart';
import '../../../custom_widgets/build_divider.dart';
import '../../../custom_widgets/social_register.dart';
import '../../../utils/app_colors.dart';
import '../../forget_password/views/forget_password_view.dart';
import '../../register/views/register_view.dart';
import '../../register/widgets/custom_register_button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password;
  bool isButtonEnabled = false;
  bool isPasswordCorrect = true;
  bool isCheckedRememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: autovalidateMode,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.75,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              hintText: 'username',
              image: AppImages.kProfile,
              isPasswordCorrect: isPasswordCorrect,
              onSaved: (value) {
                email = value!.trim();
              },
              onChanged: (value) {
                setState(() {
                  email = value.trim();

                  isButtonEnabled = isPasswordCorrect;
                });
              },
            ),
            const SizedBox(height: 16),

            // password textfield
            CustomTextField(
              hintText: 'Password',
              image: AppImages.kPassword,
              isPasswordCorrect: isPasswordCorrect,
              onSaved: (value) {
                password = value!.trim();
                isButtonEnabled = isPasswordCorrect;
              },
              onChanged: (value) {
                setState(() {
                  password = value.trim();
                  isButtonEnabled = isPasswordCorrect;
                });
              },
            ),

            Row(
              children: [
                Theme(
                  data: ThemeData(
                    unselectedWidgetColor: AppColors.kBoarderColor,
                  ),
                  child: Checkbox(
                    activeColor: AppColors.kBorderFocusColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    value: isCheckedRememberMe,
                    onChanged: (value) {
                      setState(() {
                        isCheckedRememberMe = value!;
                      });
                    },
                  ),
                ),
                const Text(
                  "Remember Me",
                  style: TextStyle(
                    color: Color(0xff1F2937),
                    fontSize: 14,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const ForgetPasswordView();
                      },
                    ));
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff3366FF),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Center(
              child: AuthAuthenticationOption(
                  text: 'Dont’t have an account?',
                  action: 'Register',
                  onPressed: () {
                    Navigator.pushNamed(context, RegisterView.id);
                  }),
            ),

            CustomRegisterButton(
              isButtonEnabled: isButtonEnabled,
              text: "Login",
              onPressed: () async {
                SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();

                if (_formKey.currentState!.validate()) {
                  _formKey.currentState?.save();
                  BlocProvider.of<LoginCubit>(context)
                      .login(email: email, password: password);
                  if (isCheckedRememberMe == true) {
                    sharedPreferences.setString(kEmail, email);
                  }
                } else {
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
                  });
                }
              },
            ),
            const BuildDivier(text: 'Or Login With Account'),
            const SocialRegister(),
          ],
        ),
      ),
    );
  }
}
