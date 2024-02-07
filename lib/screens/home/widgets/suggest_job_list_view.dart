import 'package:flutter/cupertino.dart';

import '../../../models/suggest_job_model.dart';

class SuggestJobListView extends StatelessWidget {
  const SuggestJobListView(
      {super.key,
      required this.jobsModel,
});

  final List<SuggestJobsModel> jobsModel;
 
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      // physics: NeverScrollableScrollPhysics(),
      itemCount: jobsModel.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            //
          },
          // child: SuggestJob(
          //   job: jobsModel[index],
          // ),
        );
      },
    );
  }
}
