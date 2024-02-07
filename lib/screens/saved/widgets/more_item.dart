import 'package:flutter/material.dart';
import 'package:job_finder_app/models/favorites_jobs_model.dart';
import 'package:job_finder_app/models/jobs_model.dart';
import 'package:job_finder_app/screens/apply_job/views/apply_job_view.dart';
import 'package:job_finder_app/services/favorites_api_service.dart';
import 'package:job_finder_app/utils/app_fonts.dart';
import 'package:job_finder_app/utils/app_images.dart';
import 'package:share_plus/share_plus.dart';

import '../../home/widgets/recent_job.dart';

class MoreItem extends StatefulWidget {
  const MoreItem({
    super.key,
    required this.job,
  });
  final FavoritesJobsModel job;

  @override
  State<MoreItem> createState() => _MoreItemState();
}

class _MoreItemState extends State<MoreItem> {
  List<String> title = [
    'Apply Job',
    'Share via...',
    'Cancel save',
  ];

  List<String> image = [
    AppImages.kDirectbox,
    AppImages.kExport,
    AppImages.kArchive,
  ];

  bool isSaved = true;

  @override
  Widget build(BuildContext context) {
    JobsModel jobModel = convertFavoriteToJob(widget.job);

    return ListView.builder(
      itemCount: title.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Column(
          children: [
            GestureDetector(
              onTap: () async {
                if (title[index] == 'Apply Job') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ApplyJobView(
                          jobId: widget.job.job_id!,
                        );
                      },
                    ),
                  );
                } else if (title[index] == 'Share via...') {
                  Share.share(widget.job.comp_website!);
                } else if (title[index] == 'Cancel save') {
                  setState(() {
                    isSaved = false; // toggle saved state
                  });

                  FavoritesApiService.cancelSaveFavoriteJob(widget.job);

                  saveJob(jobModel.name, remove: true);
                }
              },
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: const Color(0xffD1D5DB),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Image.asset(image[index]),
                      const SizedBox(width: 20),
                      Text(
                        title[index],
                        style: const TextStyle(
                          color: Color(0xff111827),
                          fontSize: 16,
                          fontFamily: AppFonts.kLoginHeadlineFont,
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.keyboard_arrow_right_outlined,
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
          ],
        );
      },
    );
  }
}
