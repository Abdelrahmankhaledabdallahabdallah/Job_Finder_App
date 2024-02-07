import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_finder_app/models/user_model.dart';
import 'package:job_finder_app/screens/register/widgets/custom_register_button.dart';
import 'package:job_finder_app/utils/app_fonts.dart';
import 'package:job_finder_app/utils/app_images.dart';

import '../../../cubits/register_cubit/register_cubit.dart';
import '../../../custom_widgets/auth_authentication_option.dart';
import '../../../custom_widgets/build_divider.dart';
import '../../../custom_widgets/custom_textfield.dart';
import '../../../custom_widgets/social_register.dart';
import '../../../utils/app_colors.dart';
import '../../login/views/login_view.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  UserModel userModel = UserModel();
  bool isPasswordCorrect = true;
  bool isButtonEnabled = false;
  Color passwordErrorColor = AppColors.kRegisterHints;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // name textfield
          CustomTextField(
            hintText: 'name',
            image: AppImages.kProfile,
            isPasswordCorrect: isPasswordCorrect,
            onSaved: (value) {
              userModel.name = value!;
            },
          ),
          const SizedBox(height: 16),

          // email textfield
          CustomTextField(
            hintText: 'Email',
            image: AppImages.kEmail,
            isPasswordCorrect: isPasswordCorrect,
            onSaved: (value) {
              userModel.email = value!;
            },
          ),
          const SizedBox(height: 16),

          // password textfield
          CustomTextField(
            hintText: 'Password',
            image: AppImages.kPassword,
            isPasswordCorrect: isPasswordCorrect,
            onSaved: (value) {
              userModel.password = value!;
            },
            onChanged: (value) {
              setState(() {
                isPasswordCorrect = false;
                if (value.length >= 8) {
                  isPasswordCorrect = true;
                  passwordErrorColor = const Color(0xff60C631);
                  userModel.password = value;
                } else {
                  isPasswordCorrect = false;
                  passwordErrorColor = const Color(0xffFF472B);
                }
                isButtonEnabled = isPasswordCorrect;
              });
            },
          ),
          const SizedBox(height: 10),
          Text(
            'Password must be at least 8 characters',
            style: TextStyle(
              fontSize: 16,
              color: passwordErrorColor,
              fontFamily: AppFonts.kRegisterHintFont,
            ),
          ),

          const SizedBox(
            height: 95,
          ),

          Center(
            child: AuthAuthenticationOption(
                action: 'Login',
                onPressed: () {
                  Navigator.pushNamed(context, LoginView.id);
                },
                text: 'Already have an account?'),
          ),
          CustomRegisterButton(
            isButtonEnabled: isButtonEnabled,
            text: "Create account",
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState?.save();
                BlocProvider.of<RegisterCubit>(context)
                    .registerUser(userModel);
              } else {
                setState(() {
                  autovalidateMode = AutovalidateMode.always;
                });
              }
            },
          ),
          const BuildDivier(text: 'Or Sign up With Account'),
          const SocialRegister(),
        ],
      ),
    );
  }
}
