import 'package:flutter/material.dart';
import 'package:job_finder_app/models/jobs_model.dart';
import 'package:job_finder_app/screens/home/widgets/successful_applying_item.dart';

class SuccessfulApplyingListView extends StatelessWidget {
  const SuccessfulApplyingListView({super.key, required this.jobs});
  final List<JobsModel> jobs;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .1,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true, // btkhle l listview kolohm y build mara wa7da
        itemCount: jobs.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SuccessfulApplyingItem(
              job: jobs[index],
            ),
          );
        },
      ),
    );
  }
}
