import 'package:flutter/cupertino.dart';

import '../../../utils/app_fonts.dart';

class CustomContactUs extends StatelessWidget {
  const CustomContactUs({
    super.key,
    required this.job,
    required this.text,
  });

  final String job;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffE5E7EB)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xff9CA3AF),
              fontFamily: AppFonts.kLoginSubHeadlineFont,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            job,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xff111827),
              fontFamily: AppFonts.kLoginHeadlineFont,
            ),
          ),
        ],
      ),
    );
  }
}
