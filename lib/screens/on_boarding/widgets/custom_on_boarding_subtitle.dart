import 'package:flutter/cupertino.dart';

import '../../../models/on_boarding_model.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_fonts.dart';

class CustomOnBoardingSubtitle extends StatelessWidget {
  const CustomOnBoardingSubtitle({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 8),
      child: Text(
        content[index].subtitle,
        style: const TextStyle(
            color: AppColors.kOnBoardingSubHeadline,
            fontSize: 16,
            fontFamily: AppFonts.kOnBoardingSubHeadlineFont),
      ),
    );
  }
}
