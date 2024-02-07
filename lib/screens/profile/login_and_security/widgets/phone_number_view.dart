import 'package:flutter/material.dart';
import 'package:job_finder_app/custom_widgets/phone_text_field.dart';

import '../../../../custom_widgets/custom_button.dart';
import '../../../../custom_widgets/custom_switch.dart';
import '../../../../utils/app_fonts.dart';

class PhoneNumberView extends StatelessWidget {
  const PhoneNumberView({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Phone number',
          style: TextStyle(
            color: Colors.black,
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
              'Main phone number',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xff111827),
                fontFamily: AppFonts.kLoginSubHeadlineFont,
              ),
            ),
            const SizedBox(height: 10),
            Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: PhoneTextField(autovalidateMode: autovalidateMode),
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Use the phone number to reset your \npassword',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff6B7280),
                    fontFamily: AppFonts.kLoginSubHeadlineFont,
                  ),
                ),
                CustomSwitch(),
              ],
            ),
            const Spacer(),
            CustomButton(
              onPressed: () {},
              text: 'Save',
            ),
          ],
        ),
      ),
    );
  }
}
