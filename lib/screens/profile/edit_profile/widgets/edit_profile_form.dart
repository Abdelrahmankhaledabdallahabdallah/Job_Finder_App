import 'package:flutter/material.dart';
import 'package:job_finder_app/custom_widgets/phone_text_field.dart';
import 'package:job_finder_app/utils/app_fonts.dart';

import 'edit_profile_form_item.dart';

class EditProfileForm extends StatefulWidget {
  const EditProfileForm({super.key});

  @override
  State<EditProfileForm> createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const EditProfileFormItem(title: 'Name'),
          const SizedBox(height: 20),
          const EditProfileFormItem(
            title: 'Bio',
          ),
          const SizedBox(height: 20),
          const EditProfileFormItem(title: 'Address'),
          const SizedBox(height: 20),
          const Text(
            'No.Handphone',
            style: TextStyle(
              color: Color(0xff9CA3AF),
              fontSize: 16,
              fontFamily: AppFonts.kLoginHeadlineFont,
            ),
          ),
          const SizedBox(height: 8),
          PhoneTextField(autovalidateMode: autovalidateMode),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
