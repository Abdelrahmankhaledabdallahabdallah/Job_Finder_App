import 'package:flutter/material.dart';
import 'package:job_finder_app/models/favorites_jobs_model.dart';
import 'package:job_finder_app/utils/app_fonts.dart';
import 'package:job_finder_app/utils/app_images.dart';
import 'package:job_finder_app/utils/constants.dart';

import '../../../utils/app_colors.dart';
import 'more_item.dart';

class SavedJobs extends StatefulWidget {
  const SavedJobs({
    super.key,
    required this.job,
  });
  final FavoritesJobsModel job;

  @override
  State<SavedJobs> createState() => _SavedJobsState();
}

class _SavedJobsState extends State<SavedJobs> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              widget.job.job_image ?? '',
              width: 40,
              height: 40,
            ),
          ),
          title: Text(
            widget.job.job_name!,
            style: const TextStyle(
              color: Color(0xff111827),
              fontFamily: AppFonts.kLoginHeadlineFont,
              fontSize: 18,
            ),
          ),
          subtitle: Text(
            '${widget.job.comp_name} • ${showLocation(widget.job.location!)}',
            style: const TextStyle(
              color: Color(0xff374151),
              fontFamily: AppFonts.kLoginSubHeadlineFont,
              fontSize: 12,
            ),
          ),
          trailing: GestureDetector(
            onTap: () {
              showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                context: context,
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        right: 25, left: 25, top: 10, bottom: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            width: 48,
                            height: 3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 20),
                          MoreItem(job: widget.job),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: Image.asset(AppImages.kMore),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Posted ${convertTime(widget.job.created_at!).toString()} days ago',
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xff374151),
                  fontFamily: AppFonts.kLoginSubHeadlineFont,
                ),
              ),
              Row(
                children: [
                  Image.asset(
                    AppImages.kClock,
                  ),
                  const SizedBox(width: 5),
                  const Text(
                    'Be an early applicant',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: AppFonts.kLoginSubHeadlineFont,
                      color: Color(0xff374151),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Divider(
            color: AppColors.kDividerColor,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}

