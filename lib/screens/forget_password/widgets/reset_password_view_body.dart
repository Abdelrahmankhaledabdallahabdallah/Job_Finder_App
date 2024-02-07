import 'package:flutter/material.dart';
import 'package:job_finder_app/custom_widgets/custom_button.dart';
import 'package:job_finder_app/custom_widgets/custom_success_processes.dart';
import 'package:job_finder_app/custom_widgets/custom_textfield.dart';
import 'package:job_finder_app/screens/login/views/login_view.dart';
import 'package:job_finder_app/services/user_api_service.dart';
import 'package:job_finder_app/utils/app_colors.dart';
import 'package:job_finder_app/utils/app_fonts.dart';

import '../../../utils/app_images.dart';

class ResetPasswordViewBody extends StatefulWidget {
  const ResetPasswordViewBody({super.key});

  @override
  State<ResetPasswordViewBody> createState() => _ResetPasswordViewBodyState();
}

class _ResetPasswordViewBodyState extends State<ResetPasswordViewBody> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
    late String password;
    late String confirmPassword;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Create new password',
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
            'Set your new password so you can login and acces Jobsque',
            style: TextStyle(
              fontSize: 16,
              fontFamily: AppFonts.kLoginSubHeadlineFont,
              color: AppColors.kLoginSubHeadlines,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Form(
                  key: formKey,
                  autovalidateMode: autovalidateMode,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                        hintText: 'Enter your new password...',
                        image: AppImages.kPassword,
                        isPasswordCorrect: true,
                        onSaved: (value) {
                          password = value!.trim();
                        },
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'Password must be at least 8 characters',
                          style: TextStyle(
                            color: Color(0xff9CA3AF),
                            fontSize: 16,
                            fontFamily: AppFonts.kLoginSubHeadlineFont,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        hintText: 'Rewrite your new password...',
                        image: AppImages.kPassword,
                        isPasswordCorrect: true,
                        onSaved: (value) {
                          confirmPassword = value!.trim();
                        },
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'Both password must match',
                          style: TextStyle(
                            color: Color(0xff9CA3AF),
                            fontSize: 16,
                            fontFamily: AppFonts.kLoginSubHeadlineFont,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        // const Spacer(),
        CustomButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              formKey.currentState?.save();

              if (password == confirmPassword) {
                UserApiService.updatePassword(password: password.trim());
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return CustomSuccessProcesses(
                      buttonText: 'Open email app',
                      image: AppImages.kPasswordSuccesfullyIlustration,
                      subtitle:
                          'Your password has been changed successfully, we will let you know if there are more problems with your account',
                      title: 'Password changed succesfully!',
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const LoginView();
                          },
                        ));
                      },
                    );
                  },
                ));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Passwords do not match.'),
                    backgroundColor: Colors.red,
                  ),
                );
              }
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
