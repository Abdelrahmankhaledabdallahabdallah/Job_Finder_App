import 'package:flutter/material.dart';

import '../../../utils/app_fonts.dart';
import '../../../utils/app_images.dart';

class NoSavedJobs extends StatelessWidget {
  const NoSavedJobs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.kSavedIlustration),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Nothing has been saved yet',
              style: TextStyle(
                  fontSize: 24,
                  fontFamily: AppFonts.kRegisterHeadlineFont,
                  color: Color(0xff111827)),
            ),
            const SizedBox(
              height: 16,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Press the star icon on the job you want to save.',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff6B7280),
                  fontFamily: AppFonts.kRegisterHintFont,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}