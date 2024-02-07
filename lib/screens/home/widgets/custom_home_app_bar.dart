import 'package:flutter/material.dart';
import 'package:job_finder_app/models/user_model.dart';
import 'package:job_finder_app/services/user_api_service.dart';
import 'package:job_finder_app/utils/app_colors.dart';
import 'package:job_finder_app/utils/app_fonts.dart';
import 'package:job_finder_app/utils/app_images.dart';
import 'package:job_finder_app/utils/constants.dart';

import '../../notification/views/notification_view.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserModel>(
      future: UserApiService.fetchUserData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi, ${snapshot.data!.name!.capitalize()}👋',
                      style: const TextStyle(
                        fontFamily: AppFonts.kLoginHeadlineFont,
                        fontSize: 24,
                        color: AppColors.kLoginHeadlines,
                      ),
                    ),
                    const SizedBox(height: 8), 
                    const Text(
                      'Create a better future for yourself here',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: AppFonts.kLoginSubHeadlineFont,
                        color: AppColors.kLoginSubHeadlines,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return NotificationView(
                        notificationStatus: true,
                      );
                    },
                  ),
                ),
                child: CircleAvatar(
                  backgroundColor: const Color(0xffD1D5DB),
                  radius: 27,
                  child: CircleAvatar(
                    backgroundColor: const Color(0xffFAFAFA),
                    radius: 26,
                    child: ColorFiltered(
                      colorFilter: const ColorFilter.mode(
                        (Color(0xff292D32)),
                        BlendMode.modulate,
                      ),
                      child: Image.asset(AppImages.kNotificationIcon),
                    ),
                  ),
                ),
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        // By default, show a loading spinner.
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

