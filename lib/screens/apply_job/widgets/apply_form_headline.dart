import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_fonts.dart';

class ApplyFormHeadline extends StatelessWidget {
  const ApplyFormHeadline(
      {super.key, required this.headline, required this.subheadline});
  final String headline;
  final String subheadline;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 5),
          child: Text(
            headline,
            style: const TextStyle(
              fontSize: 20,
              color: AppColors.kLoginHeadlines,
              fontFamily: AppFonts.kLoginHeadlineFont,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            subheadline,
            style: const TextStyle(
              color: Color(0xff6B7280),
              fontSize: 14,
              fontFamily: AppFonts.kLoginSubHeadlineFont,
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
