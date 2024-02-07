import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:job_finder_app/utils/app_fonts.dart';
import '../utils/app_colors.dart';

class PhoneTextField extends StatelessWidget {
  const PhoneTextField({
    super.key,
    required this.autovalidateMode,
    this.onSaved,
  });

  final AutovalidateMode autovalidateMode;
  final void Function(PhoneNumber?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      autovalidateMode: autovalidateMode,
      validator: (value) {
        if (value == null || !value.isValidNumber()) {
          return 'Please enter your phone';
        }

        return null;
      },
      decoration: const InputDecoration(
        hintText: 'No.Handphone',
        hintStyle: TextStyle(
          color: AppColors.kRegisterHints,
          fontSize: 14,
          fontFamily: AppFonts.kRegisterHintFont,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.kBoarderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.kBorderFocusColor,
          ),
        ),
        // 4- the error border
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: Color(0xffFF472B),
          ),
        ),
      ),
      initialCountryCode: 'EG',
      onSaved: onSaved,
      disableLengthCheck: true,
      dropdownIconPosition: IconPosition.trailing,
      flagsButtonPadding: const EdgeInsets.only(left: 8),
    );
  }
}
