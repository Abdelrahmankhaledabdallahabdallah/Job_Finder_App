import 'package:flutter/material.dart';
import 'package:job_finder_app/custom_widgets/custom_button.dart';
import 'package:job_finder_app/custom_widgets/custom_success_processes.dart';
import 'package:job_finder_app/custom_widgets/custom_textfield.dart';
import 'package:job_finder_app/screens/forget_password/widgets/reset_password_view.dart';
import 'package:job_finder_app/screens/login/views/login_view.dart';
import 'package:job_finder_app/services/user_api_service.dart';
import 'package:job_finder_app/utils/app_colors.dart';
import 'package:job_finder_app/utils/app_fonts.dart';

import '../../../utils/app_images.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
    late String email;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Reset Password',
          style: TextStyle(
            fontSize: 28,
            fontFamily: AppFonts.kLoginHeadlineFont,
            color: AppColors.kLoginHeadlines,
          ),
        ),
        const SizedBox(height: 5),
        const Padding(
          padding: EdgeInsets.all(4.0),
          child: Text(
            'Enter the email address you used when you joined and we’ll send you instructions to reset your password.',
            style: TextStyle(
              fontSize: 16,
              fontFamily: AppFonts.kLoginSubHeadlineFont,
              color: AppColors.kLoginSubHeadlines,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Column(
          children: [
            Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: CustomTextField(
                hintText: 'Enter your email....',
                image: AppImages.kEmail,
                isPasswordCorrect: true,
                onSaved: (value) {
                  email = value!.trim();
                },
              ),
            ),
          ],
        ),
        // const SizedBox(height: 10),
        const Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const LoginView();
              },
            ));
          },
          child: Center(
            child: RichText(
              text: const TextSpan(
                text: 'You remember your password',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff9CA3AF),
                  fontFamily: AppFonts.kLoginHeadlineFont,
                ),
                children: [
                  TextSpan(
                    text: ' Login',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff3366FF),
                      fontFamily: AppFonts.kLoginHeadlineFont,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        CustomButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              formKey.currentState?.save();

              UserApiService.getOtp(email: email.trim());

              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return CustomSuccessProcesses(
                    image: AppImages.kEmailIlustration,
                    title: 'Check your Email',
                    subtitle:
                        'We have sent a reset password to your email address',
                    buttonText: 'Open email app',
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const ResetPasswordView();
                        },
                      ));
                    },
                  );
                },
              ));
            } else {
              setState(() {
                autovalidateMode = AutovalidateMode.always;
              });
            }
          },
          text: 'Request password',
        ),
      ],
    );
  }
}
