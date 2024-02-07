import 'package:flutter/material.dart';

import '../../../utils/app_fonts.dart';

class CustomNewPostedNotification extends StatelessWidget {
  const CustomNewPostedNotification({
    super.key,
    required this.image,
    required this.title,
    required this.content,
  });

  final String image;
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      child: Row(
        children: [
          Image.asset(image),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Color(0xff111827),
                  fontSize: 14,
                  fontFamily: AppFonts.kLoginHeadlineFont,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 160,
                child: Text(
                  content,
                  style: const TextStyle(
                    color: Color(0xff6B7280),
                    fontSize: 12,
                    fontFamily: AppFonts.kLoginSubHeadlineFont,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          const CircleAvatar(
            backgroundColor: Color(0xffDBB40E),
            radius: 4,
          ),
          const SizedBox(width: 8),
          const Text(
            '10.00AM',
            style: TextStyle(
              color: Color(0xff6B7280),
              fontSize: 12,
              fontFamily: AppFonts.kLoginSubHeadlineFont,
            ),
          ),
        ],
      ),
    );
  }
}
