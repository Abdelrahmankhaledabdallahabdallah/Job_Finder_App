import 'package:flutter/material.dart';
import 'package:job_finder_app/screens/profile/widgets/profile_information.dart';
import 'package:job_finder_app/utils/app_fonts.dart';
import 'package:job_finder_app/utils/constants.dart';

import '../../../utils/shared_prefs.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          SharedPrefs().username.capitalize(),
          style: const TextStyle(
            fontFamily: AppFonts.kLoginHeadlineFont,
            fontSize: 20,
            color: Color(0xff111827),
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Senior UI/UX Designer',
          style: TextStyle(
            fontFamily: AppFonts.kLoginSubHeadlineFont,
            fontSize: 14,
            color: Color(0xff6B7280),
          ),
        ),
        const SizedBox(height: 20),
        const ProfileInformation(),
      ],
    );
  }
}
