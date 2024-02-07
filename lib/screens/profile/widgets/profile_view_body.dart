import 'package:flutter/material.dart';
import 'package:job_finder_app/screens/profile/widgets/profile_details.dart';
import 'package:job_finder_app/screens/profile/widgets/profile_user_about.dart';
import 'package:job_finder_app/screens/profile/widgets/user_profile_image.dart';
import 'package:job_finder_app/utils/app_fonts.dart';

import 'general_list_view.dart';
import 'others_list_view.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const UserProfileImage(),
          const SizedBox(height: 16),
          const ProfileDetails(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProfileUserAbout(),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                color: const Color(0xffE5E7EB),
                child: const Text(
                  'General',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff6B7280),
                    fontFamily: AppFonts.kLoginHeadlineFont,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const GeneralListView(),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                color: const Color(0xffE5E7EB),
                child: const Text(
                  'Others',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff6B7280),
                    fontFamily: AppFonts.kLoginHeadlineFont,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const OthersListView(),
            ],
          ),
        ],
      ),
    );
  }
}
