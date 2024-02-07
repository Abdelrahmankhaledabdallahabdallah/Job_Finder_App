import 'package:flutter/material.dart';

import '../../../utils/app_fonts.dart';

class CustomContainerNotification extends StatelessWidget {
  const CustomContainerNotification({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xffF4F4F5),
        ),
        color: const Color(0xffE5E7EB),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      width: double.infinity,
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xff6B7280),
          fontSize: 14,
          fontFamily: AppFonts.kLoginHeadlineFont,
        ),
      ),
    );
  }
}
