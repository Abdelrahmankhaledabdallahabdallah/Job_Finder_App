import 'package:flutter/material.dart';
import 'package:job_finder_app/custom_widgets/custom_button.dart';
import 'package:job_finder_app/models/jobs_model.dart';
import 'package:job_finder_app/screens/apply_job/views/apply_job_view.dart';
import 'package:job_finder_app/screens/job_details/widgets/job_details_view_body.dart';
import 'package:job_finder_app/utils/app_fonts.dart';
import 'package:job_finder_app/utils/app_images.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../services/favorites_api_service.dart';
import '../../../utils/constants.dart';
import '../../home/widgets/recent_job.dart';

class JobDetailsView extends StatefulWidget {
  const JobDetailsView({super.key, required this.job});

  final JobsModel job;

  @override
  State<JobDetailsView> createState() => _JobDetailsViewState();
}

class _JobDetailsViewState extends State<JobDetailsView> {
  bool isSaved = false;

  @override
  void initState() {
    super.initState();
    checkIfJobIsSaved(widget.job.name ?? "");
  }

  void checkIfJobIsSaved(String job) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> savedJobs = prefs.getStringList(kSavedJobs) ?? [];
    if (savedJobs.contains(job)) {
      setState(() {
        isSaved = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Center(
          child: Text(
            'Job Detail',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: AppFonts.kLoginHeadlineFont,
            ),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: JobDetailsViewBody(job: widget.job),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: CustomButton(
            onPressed: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ApplyJobView(jobId: widget.job.id!),
                  ));
            },
            text: 'Apply now'),
      ),
    );
  }
}
