import 'package:flutter/material.dart';
import 'package:job_finder_app/models/apply_job_model.dart';
import 'package:job_finder_app/screens/apply_job/widgets/applying_process.dart';
import 'package:job_finder_app/services/job_api_service.dart';
import 'package:job_finder_app/utils/app_images.dart';

import '../../../models/jobs_model.dart';
import '../../../utils/constants.dart';

class AppliedJobItem extends StatelessWidget {
  const AppliedJobItem({
    super.key,
    required this.job,
  });

  final ApplyJobsModel job;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          AppliedCompanyInfo(job: job),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xffD1D5DB)),
              borderRadius: BorderRadius.circular(8),
            ),
            child:  ApplyingProcess(
                currentStep: 4,
                ),
          ),
        ],
      ),
    );
  }
}

class AppliedCompanyInfo extends StatelessWidget {
  const AppliedCompanyInfo({
    super.key,
    required this.job,
  });

  final ApplyJobsModel job;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<JobsModel>(
      future: JobApiService.fetchJobData(job_id: job.jobs_id),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final jobsModel = snapshot.data!;
          return ListTile(
            title: Text(jobsModel.name ?? ""),
            subtitle: Text(
              '${jobsModel.comp_name} • ${showLocation(jobsModel.location ?? '')}',
            ),
            leading: Image.network(jobsModel.image ?? ""),
            trailing: Image.asset(AppImages.kArchive),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
