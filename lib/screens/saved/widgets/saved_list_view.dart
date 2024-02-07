import 'package:flutter/material.dart';
import 'package:job_finder_app/models/favorites_jobs_model.dart';
import 'package:job_finder_app/screens/saved/widgets/saved_jobs.dart';

class SavedListView extends StatelessWidget {
  const SavedListView({
    super.key,
    required this.jobsModel,
  });

  final List<FavoritesJobsModel> jobsModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: jobsModel.length,
      itemBuilder: (context, index) {
        return SavedJobs(
          job: jobsModel[index],
        );
      },
    );
  }
}
