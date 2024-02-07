// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:job_finder_app/custom_widgets/custom_button.dart';
import 'package:job_finder_app/screens/home/views/home_view.dart';
import 'package:job_finder_app/utils/app_fonts.dart';

class TwoStepVerificationViewFour extends StatelessWidget {
  const TwoStepVerificationViewFour({super.key});

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
              'Enter the 6 digit code',
              style: TextStyle(
                fontSize: 16,
                fontFamily: AppFonts.kLoginHeadlineFont,
                color: Color(0xff111827),
              ),
            ),
            const SizedBox(height: 10),
            RichText(
              text: const TextSpan(
                text:
                    'Please confirm your account by entering the \nauthorization code sen to ',
                style: TextStyle(
                  color: Color(0xff6B7280),
                  fontSize: 14,
                  fontFamily: AppFonts.kLoginSubHeadlineFont,
                ),
                children: [
                  TextSpan(
                    text: '****-****-7234',
                    style: TextStyle(
                      color: Color(0xff111827),
                      fontSize: 14,
                      fontFamily: AppFonts.kLoginSubHeadlineFont,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: const Color(0xffD1D5DB),
                    ),
                  ),
                  child: const Text('2'),
                ),
                const SizedBox(width: 10),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: const Color(0xffD1D5DB),
                    ),
                  ),
                  child: const Text('2'),
                ),
                const SizedBox(width: 10),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: const Color(0xffD1D5DB),
                    ),
                  ),
                  child: const Text('2'),
                ),
                const SizedBox(width: 10),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: const Color(0xffD1D5DB),
                    ),
                  ),
                  child: const Text('2'),
                ),
                const SizedBox(width: 10),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: const Color(0xffD1D5DB),
                    ),
                  ),
                  child: const Text('2'),
                ),
                const SizedBox(width: 10),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: const Color(0xffD1D5DB),
                    ),
                  ),
                  child: const Text('2'),
                ),
                const SizedBox(width: 10),
              ],
            ),
            const SizedBox(height: 15),
            RichText(
              text: const TextSpan(
                text: 'Resend code ',
                style: TextStyle(
                  color: Color(0xff9CA3AF),
                  fontSize: 16,
                  fontFamily: AppFonts.kLoginSubHeadlineFont,
                ),
                children: [
                  TextSpan(
                    text: '42s',
                    style: TextStyle(
                      color: Color(0xff3366FF),
                      fontSize: 16,
                      fontFamily: AppFonts.kLoginHeadlineFont,
                    ),
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
                          return const HomeView();
                        },
                      ),
                    ),
                text: 'Verify')
          ],
        ),
      ),
    );
  }
}
