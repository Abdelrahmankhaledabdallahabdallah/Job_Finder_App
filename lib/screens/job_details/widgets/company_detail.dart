import 'package:flutter/material.dart';
import 'package:job_finder_app/models/jobs_model.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_fonts.dart';
import 'custom_contact_us.dart';

class CompanyDetail extends StatelessWidget {
  const CompanyDetail({
    super.key,
    required this.job,
  });

  final JobsModel job;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            'Contact Us',
            style: TextStyle(
              fontSize: 14,
              fontFamily: AppFonts.kLoginHeadlineFont,
              color: AppColors.kLoginHeadlines,
            ),
          ),
        ),
        Row(
          children: [
            CustomContactUs(
              job: job.comp_email ?? '',
              text: 'Email',
            ),
            const SizedBox(width: 8),
            CustomContactUs(
              job: job.comp_website ?? '',
              text: 'Website',
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Text(
          'About Company',
          style: TextStyle(
            fontSize: 14,
            fontFamily: AppFonts.kLoginHeadlineFont,
            color: AppColors.kLoginHeadlines,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          job.about_comp ?? '',
          style: const TextStyle(
            fontSize: 12,
            fontFamily: AppFonts.kLoginSubHeadlineFont,
            color: Color(0xff4B5563),
          ),
        ),
      ],
    );
  }
}
