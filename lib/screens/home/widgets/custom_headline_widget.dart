import 'package:flutter/cupertino.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_fonts.dart';


class CustomHeadlineWidget extends StatelessWidget {
  const CustomHeadlineWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            color: AppColors.kLoginHeadlines,
            fontFamily: AppFonts.kLoginHeadlineFont,
          ),
        ),
        const Text(
          'View all',
          style: TextStyle(
            fontSize: 14,
            color: AppColors.kBorderFocusColor,
            fontFamily: AppFonts.kLoginHeadlineFont,
          ),
        ),
      ],
    );
  }
}
