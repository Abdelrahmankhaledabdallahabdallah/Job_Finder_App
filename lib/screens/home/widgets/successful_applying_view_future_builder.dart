import 'package:flutter/material.dart';
import 'package:job_finder_app/screens/home/widgets/successful_applying_item.dart';

import '../../../services/job_api_service.dart';

class SuccessfulApplyingViewFutureBuilder extends StatelessWidget {
  const SuccessfulApplyingViewFutureBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: JobApiService.fetchSuccessfulApplyingJob(),
      builder: (context, snapshot) {
        if (!snapshot.hasError) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SuccessfulApplyingItem(
              job: snapshot.data!,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        } else {
          return Text(
            snapshot.error.toString(),
            style: const TextStyle(
              color: Colors.white,
            ),
          );
        }
      },
    );
  }
}
