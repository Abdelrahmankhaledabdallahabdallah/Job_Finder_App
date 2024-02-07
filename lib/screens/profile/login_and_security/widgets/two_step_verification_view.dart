import 'package:flutter/material.dart';
import 'package:job_finder_app/custom_widgets/custom_button.dart';
import 'package:job_finder_app/screens/profile/login_and_security/widgets/two_step_verification_view_two.dart';
import 'package:job_finder_app/utils/app_fonts.dart';
import 'package:job_finder_app/utils/app_images.dart';

import '../../../../custom_widgets/custom_switch.dart';

class TwoStepVerificationView extends StatelessWidget {
  const TwoStepVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Two-step verification',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: AppFonts.kLoginHeadlineFont,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xffD1D5DB)),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Secure your account with \ntwo-step verification',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: AppFonts.kLoginHeadlineFont,
                        color: Color(0xff6B7280),
                      ),
                    ),
                    CustomSwitch(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: const Color(0xffD6E4FF),
                  child: Image.asset(AppImages.kLock),
                ),
                const SizedBox(width: 10),
                const Text(
                  'Two-step verification provides additional \nsecurity by asking for a verification \ncode every time you log in on another device.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff6B7280),
                    fontFamily: AppFonts.kLoginSubHeadlineFont,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: const Color(0xffD6E4FF),
                  child: Image.asset(AppImages.kExternalDrive),
                ),
                const SizedBox(width: 10),
                const Text(
                  'Adding a phone number or using an \nauthenticator will help keep your account \nsafe from harm.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff6B7280),
                    fontFamily: AppFonts.kLoginSubHeadlineFont,
                  ),
                ),
              ],
            ),
            const Spacer(),
            CustomButton(
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const TwoStepVerificationViewTwo();
                        },
                      ),
                    ),
                text: 'Next')
          ],
        ),
      ),
    );
  }
}
