import 'package:flutter/material.dart';
import 'package:flutter_ripple/flutter_ripple.dart';
import 'package:job_finder_app/utils/app_colors.dart';
import 'package:job_finder_app/utils/app_images.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: FlutterRipple(
        rippleColor: Colors.blue,
        radius: 150,
        child: Center(
          child: Image.asset(AppImages.kBigLogo),
        ),
      ),
    );
  }
}
