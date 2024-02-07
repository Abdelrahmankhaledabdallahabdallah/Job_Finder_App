import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:job_finder_app/models/jobs_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../services/favorites_api_service.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/constants.dart';

class RecentJob extends StatefulWidget {
  const RecentJob({
    super.key,
    required this.job,
  });
  final JobsModel job;

  @override
  State<RecentJob> createState() => _RecentJobState();
}

class _RecentJobState extends State<RecentJob> {
  bool isSaved = false;

  @override
  void initState() {
    super.initState();
    checkIfJobIsSaved();
  }

  void checkIfJobIsSaved() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> savedJobs = prefs.getStringList(kSavedJobs) ?? [];
    if (savedJobs.contains(widget.job.name)) {
      setState(() {
        isSaved = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                widget.job.image ?? '',
                width: 40,
                height: 40,
              ),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.job.name ?? '',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    '${widget.job.comp_name} • ${showLocation(widget.job.location ?? '')}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xff374151),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                setState(() {
                  isSaved = !isSaved; // toggle saved state
                });
                if (isSaved) {
                  FavoritesApiService.addFavoritesJobs(
                      job_id: widget.job.id.toString());
                  saveJob(widget.job.name, remove: false);
                } else {
                  FavoritesApiService.deleteJob(widget.job);
                  saveJob(widget.job.name, remove: true);
                }
              },
              child: isSaved
                  ? Image.asset(AppImages.kArchiveMinusColor)
                  : Image.asset(AppImages.kArchive),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.2,
                height: MediaQuery.of(context).size.width * 0.08,
                decoration: BoxDecoration(
                  color: const Color(0xffD6E4FF),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: Text(
                    widget.job.job_time_type ?? '',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xff3366FF),
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            RichText(
              text: TextSpan(
                text: '\$${showSalary(widget.job.salary ?? '')}',
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xff2E8E18),
                ),
                children: const [
                  TextSpan(
                    text: '/Month',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xff6B7280),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Divider(
            color: AppColors.kDividerColor,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}

saveJob(job, {required bool remove}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> savedJobs = prefs.getStringList(kSavedJobs) ?? [];
  if (remove) {
    // check if job is in the list
    if (savedJobs.contains(job)) {
      savedJobs.remove(job);
      await prefs.setStringList(kSavedJobs, savedJobs);
    }
  } else {
    if (!savedJobs.contains(job)) {
      // check if job is not already in the list
      savedJobs.add(job);
      await prefs.setStringList(kSavedJobs, savedJobs);
    }
  }
  log(savedJobs.toString());
}
