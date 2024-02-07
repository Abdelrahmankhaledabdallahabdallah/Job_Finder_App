import 'package:flutter/material.dart';
import 'package:job_finder_app/custom_widgets/custom_title.dart';

import '../../../custom_widgets/custom_subtitle.dart';
import '../../../utils/app_images.dart';
import 'login_form.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomLoginAppbar(),
            SizedBox(height: 10),
            CustomTitle(title: 'Login'),
            CustomSubtitle(subtitle: 'Please login to find your dream job'),
            SizedBox(height: 16),
            LoginForm(),
          ],
        ),
      ),
    );
  }
}

class CustomLoginAppbar extends StatelessWidget {
  const CustomLoginAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Image.asset(AppImages.kAppBarLogo),
    );
  }
}
