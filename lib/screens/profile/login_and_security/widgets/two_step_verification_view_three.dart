// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:job_finder_app/custom_widgets/custom_button.dart';
import 'package:job_finder_app/custom_widgets/custom_textfield.dart';
import 'package:job_finder_app/screens/profile/login_and_security/widgets/two_step_verification_view_four.dart';
import 'package:job_finder_app/custom_widgets/phone_text_field.dart';
import 'package:job_finder_app/utils/app_fonts.dart';
import 'package:job_finder_app/utils/app_images.dart';

class TwoStepVerificationViewThree extends StatelessWidget {
  const TwoStepVerificationViewThree({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = List.generate(
        1,
        (index) => {
              'title': 'Telephone number (SMS)',
              'content':
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ultricies mi enim, quis vulputate nibh faucibus at. Maecenas est ante, suscipit vel sem non, blandit blandit erat. Praesent pulvinar ante et felis porta vulputate. Curabitur ornare velit nec fringilla finibus. Phasellus mollis pharetra ante, in ullamcorper massa ullamcorper et. Curabitur ac leo sit amet leo interdum mattis vel eu mauris.'
            });
    final formKey = GlobalKey<FormState>();
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Add phone number',
              style: TextStyle(
                fontSize: 16,
                fontFamily: AppFonts.kLoginHeadlineFont,
                color: Color(0xff111827),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'We will send a verification code to this number',
              style: TextStyle(
                fontSize: 14,
                fontFamily: AppFonts.kLoginSubHeadlineFont,
                color: Color(0xff6B7280),
              ),
            ),
            const SizedBox(height: 10),
            Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PhoneTextField(
                    autovalidateMode: autovalidateMode,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Enter your password',
                    style: TextStyle(
                      color: Color(0xff111827),
                      fontSize: 16,
                      fontFamily: AppFonts.kLoginHeadlineFont,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const CustomTextField(
                    hintText: 'Password',
                    image: AppImages.kPassword,
                    isPasswordCorrect: true,
                  ),
                ],
              ),
            ),
            const Spacer(),
            CustomButton(
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const TwoStepVerificationViewFour();
                        },
                      ),
                    ),
                text: 'Send Code')
          ],
        ),
      ),
    );
  }
}
