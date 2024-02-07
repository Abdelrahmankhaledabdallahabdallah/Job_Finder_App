import 'package:flutter/cupertino.dart';
import 'package:job_finder_app/utils/app_fonts.dart';
import 'package:job_finder_app/utils/app_images.dart';

import '../../register/views/register_view.dart';

class CustomOnBoardingAppBar extends StatelessWidget {
  const CustomOnBoardingAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Image.asset(AppImages.kAppBarLogo),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 
              RegisterView.id);
            },
            child: const Text(
              'Skip',
              style: TextStyle(
                fontFamily: AppFonts.kAppBarFont,
                fontSize: 16,
                color: Color(0xff6B7280),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
