import 'package:flutter/material.dart';
import 'package:job_finder_app/custom_widgets/custom_button.dart';
import 'package:job_finder_app/custom_widgets/custom_textfield.dart';
import 'package:job_finder_app/utils/app_fonts.dart';
import 'package:job_finder_app/utils/app_images.dart';

class EmailAddressView extends StatelessWidget {
  const EmailAddressView({super.key});

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
          'Email address',
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
              'Main e-mail address',
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
              child: const CustomTextField(
                hintText: 'Email',
                image: AppImages.kEmail,
                isPasswordCorrect: true,
              ),
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
