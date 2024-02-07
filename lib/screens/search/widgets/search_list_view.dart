import 'package:flutter/material.dart';
import 'package:job_finder_app/models/jobs_model.dart';
import 'package:job_finder_app/screens/home/widgets/recent_job.dart';

import '../../job_details/views/job_details_view.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({super.key, required this.jobs});
  final List<JobsModel> jobs;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: jobs.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            var currentJob = jobs[index];
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return JobDetailsView(
                    job: currentJob,
                  );
                },
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: RecentJob(job: jobs[index]),
          ),
        );
      },
    );
  }
}
