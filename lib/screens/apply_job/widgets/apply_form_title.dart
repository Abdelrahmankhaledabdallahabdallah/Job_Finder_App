import 'package:flutter/cupertino.dart';

import '../../../utils/app_fonts.dart';

class ApplyFormTitle extends StatelessWidget {
  const ApplyFormTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: RichText(
        text: TextSpan(
          text: title,
          style: const TextStyle(
              color: Color(0xff111827),
              fontSize: 16,
              fontFamily: AppFonts.kLoginSubHeadlineFont),
          children: const [
            TextSpan(
              text: '*',
              style: TextStyle(
                  color: Color(0xffFF472B),
                  fontSize: 16,
                  fontFamily: AppFonts.kLoginSubHeadlineFont),
            )
          ],
        ),
      ),
    );
  }
}
