import 'package:flutter/material.dart';
import 'package:job_finder_app/custom_widgets/custom_button.dart';
import 'package:job_finder_app/screens/profile/login_and_security/widgets/two_step_verification_view_three.dart';
import 'package:job_finder_app/utils/app_fonts.dart';

import '../../../../custom_widgets/custom_switch.dart';

class TwoStepVerificationViewTwo extends StatelessWidget {
  const TwoStepVerificationViewTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = List.generate(
        1,
        (index) => {
              'title': 'Telephone number (SMS)',
              'content':
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ultricies mi enim, quis vulputate nibh faucibus at. Maecenas est ante, suscipit vel sem non, blandit blandit erat. Praesent pulvinar ante et felis porta vulputate. Curabitur ornare velit nec fringilla finibus. Phasellus mollis pharetra ante, in ullamcorper massa ullamcorper et. Curabitur ac leo sit amet leo interdum mattis vel eu mauris.'
            });
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
            const SizedBox(height: 30),
            const Text(
              'Select a verification method',
              style: TextStyle(
                fontSize: 16,
                fontFamily: AppFonts.kLoginSubHeadlineFont,
                color: Color(0xff111827),
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: const Color(0xffD1D5DB),
                        ),
                      ),
                      child: ExpansionTile(
                        childrenPadding: const EdgeInsets.only(
                          right: 8,
                          left: 16,
                          bottom: 10,
                        ),
                        title: Text(
                          item['title'],
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xff111827),
                            fontFamily: AppFonts.kLoginHeadlineFont,
                          ),
                        ),
                        iconColor: const Color(0xff9CA3AF),
                        collapsedIconColor: const Color(0xff9CA3AF),
                        children: [
                          Text(
                            item['content'],
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xff6B7280),
                              fontFamily: AppFonts.kLoginSubHeadlineFont,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Note : Turning this feature will sign you out anywhere you’re currently signed in. We will then require you to enter a verification code the first time you sign with a new device or Joby mobile application.',
              style: TextStyle(
                fontSize: 14,
                fontFamily: AppFonts.kLoginSubHeadlineFont,
                color: Color(0xff6B7280),
              ),
            ),
            const Spacer(),
            CustomButton(
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const TwoStepVerificationViewThree();
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
