import 'package:flutter/cupertino.dart';
import 'package:job_finder_app/models/jobs_model.dart';
import 'package:job_finder_app/utils/app_colors.dart';
import 'package:job_finder_app/utils/app_fonts.dart';

class JobDescription extends StatelessWidget {
  const JobDescription({
    super.key,
    required this.job,
  });

  final JobsModel job;

  @override
  Widget build(BuildContext context) {
    List<String> bulletPoints = job.job_skill!.split('\n');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        const Text(
          'Job Description',
          style: TextStyle(
            fontSize: 14,
            fontFamily: AppFonts.kLoginHeadlineFont,
            color: AppColors.kLoginHeadlines,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          job.job_description ?? '',
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xff4B5563),
            fontFamily: AppFonts.kLoginSubHeadlineFont,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Skill Required',
          style: TextStyle(
            fontSize: 14,
            fontFamily: AppFonts.kLoginHeadlineFont,
            color: AppColors.kLoginHeadlines,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 6.0, top: 10),
          child: Column(
            children: bulletPoints.map(
              (strone) {
                return Row(
                  children: [
                    const Text(
                      "\u2022",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xff4B5563),
                        fontFamily: AppFonts.kLoginSubHeadlineFont,
                        fontWeight: FontWeight.bold,
                      ),
                    ), //bullet text
                    const SizedBox(
                      width: 10,
                    ), //space between bullet and text
                    Expanded(
                      child: Text(
                        strone,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xff4B5563),
                          fontFamily: AppFonts.kLoginSubHeadlineFont,
                        ),
                      ), //text
                    ),
                  ],
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }
}
