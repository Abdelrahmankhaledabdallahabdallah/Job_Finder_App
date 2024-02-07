import 'package:flutter/material.dart';
import 'package:job_finder_app/models/apply_job_model.dart';

import 'applied_job_item.dart';

class AppliedJobListView extends StatelessWidget {
  const AppliedJobListView({
    super.key,
    required this.jobsModel,
  });

  final List<ApplyJobsModel> jobsModel;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: jobsModel.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: AppliedJobItem(
            job: jobsModel[index],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Divider(
            thickness: 1,
          ),
        );
      },
    );
  }
}
