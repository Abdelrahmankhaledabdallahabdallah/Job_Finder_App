import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_fonts.dart';

class EditProfileFormItem extends StatelessWidget {
  const EditProfileFormItem({
    super.key,
    required this.title,
  });

  final String title;
  RegExp get _emailRegex => RegExp(r'^\S+@\S+$');

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xff9CA3AF),
            fontSize: 16,
            fontFamily: AppFonts.kLoginHeadlineFont,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          decoration: InputDecoration(
            hintText: title,
            hintStyle: const TextStyle(
              color: AppColors.kRegisterHints,
              fontSize: 14,
              fontFamily: AppFonts.kRegisterHintFont,
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              borderSide: BorderSide(
                color: AppColors.kBoarderColor,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              borderSide: BorderSide(color: AppColors.kBorderFocusColor),
            ),
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              borderSide: BorderSide(
                color: Color(0xffFF472B),
              ),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your $title';
            }
            if (title.contains('Email')) {
              if (!_emailRegex.hasMatch(value)) {
                return 'Email address is not valid';
              }
            }

            return null;
          },
        ),
      ],
    );
  }
}
