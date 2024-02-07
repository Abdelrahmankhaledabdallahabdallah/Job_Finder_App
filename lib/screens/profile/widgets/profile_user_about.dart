import 'package:flutter/material.dart';
import 'package:job_finder_app/utils/app_fonts.dart';

class ProfileUserAbout extends StatelessWidget {
  const ProfileUserAbout({
    super.key,
    // required this.model,
  });

  // final UserPortofolioModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Stack(
              children: [
                const Text(
                  'About',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff6B7280),
                    fontFamily: AppFonts.kLoginHeadlineFont,
                  ),
                ),
                Positioned(
                  right: 1,
                  child: GestureDetector(
                    child: const Text(
                      'Edit',
                      style: TextStyle(
                        color: Color(0xff3366FF),
                        fontSize: 14,
                        fontFamily: AppFonts.kLoginHeadlineFont,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Bio...',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xff6B7280),
              fontFamily: AppFonts.kLoginSubHeadlineFont,
            ),
          ),
        ],
      ),
    );
  }
}
