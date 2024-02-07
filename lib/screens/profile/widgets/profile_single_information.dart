import 'package:flutter/material.dart';
import 'package:job_finder_app/utils/app_fonts.dart';

class ProfileSingleInformation extends StatelessWidget {
  const ProfileSingleInformation({
    super.key,
    required this.title,
    required this.numbers,
  });
  final String title;
  final String numbers;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xff6B7280),
              fontFamily: AppFonts.kLoginHeadlineFont,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            numbers,
            style: const TextStyle(
              fontSize: 20,
              color: Color(0xff111827),
              fontFamily: AppFonts.kLoginHeadlineFont,
            ),
          ),
        ],
      ),
    );
  }
}
