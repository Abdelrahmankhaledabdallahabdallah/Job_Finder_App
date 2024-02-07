import 'package:flutter/cupertino.dart';
import 'package:job_finder_app/models/jobs_model.dart';
import 'package:job_finder_app/utils/app_colors.dart';
import 'package:job_finder_app/utils/app_fonts.dart';

import '../../../utils/constants.dart';

class JobInformation extends StatelessWidget {
  const JobInformation({
    super.key,
    required this.job,
  });
  final JobsModel job;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            job.image!,
            width: 40,
            height: 40,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          job.name!,
          style: const TextStyle(
              fontSize: 20,
              fontFamily: AppFonts.kLoginHeadlineFont,
              color: AppColors.kLoginHeadlines),
        ),
        const SizedBox(height: 10),
        Text(
          '${job.comp_name} • ${showLocation(job.location ?? '')}',
          style: const TextStyle(
            color: Color(0xff374151),
            fontSize: 12,
            fontFamily: AppFonts.kLoginSubHeadlineFont,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: MediaQuery.of(context).size.width * 0.2,
          height: MediaQuery.of(context).size.width * 0.08,
          decoration: BoxDecoration(
            color: const Color(0xffD6E4FF),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Center(
            child: Text(
              job.job_time_type ?? '',
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xff3366FF),
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
