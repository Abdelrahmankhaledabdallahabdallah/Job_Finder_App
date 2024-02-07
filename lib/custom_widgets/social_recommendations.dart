import 'package:flutter/material.dart';
import 'package:job_finder_app/utils/app_colors.dart';
import 'package:job_finder_app/utils/app_fonts.dart';

class SocialRecommendations extends StatelessWidget {
  const SocialRecommendations({super.key, required this.image, required this.text, required this.onPressed});

  final String image;
  final String text;

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      height: MediaQuery.of(context).size.height * 0.13,
      width: MediaQuery.of(context).size.width * 0.4,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.kButtonBackround,
          elevation: 0,
          shape: RoundedRectangleBorder(
              side: const BorderSide(color: AppColors.kBoarderColor),
              borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: const TextStyle(
                color: AppColors.kSocialRegisterColor,
                fontSize: 14,
                fontFamily: AppFonts.kSocialRegisterFont,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
