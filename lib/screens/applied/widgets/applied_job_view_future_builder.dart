import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_finder_app/cubits/applied_job_cubit/applied_job_cubit.dart';
import 'package:job_finder_app/services/job_api_service.dart';

import '../../../utils/app_fonts.dart';
import 'applied_job_list_view.dart';

class AppliedJobViewFutureBuilder extends StatelessWidget {
  const AppliedJobViewFutureBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppliedJobCubit(JobApiService()),
      child: FutureBuilder(
        future: JobApiService.fetchAppliedJobs(),
        builder: (context, snapshot) {
          if (!snapshot.hasError) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xffE5E7EB),
                      ),
                      color: const Color(0xffF4F4F5),
                    ),
                    child: Text(
                      '${snapshot.data!.length} Jobs',
                      style: const TextStyle(
                        color: Color(0xff6B7280),
                        fontSize: 14,
                        fontFamily: AppFonts.kLoginHeadlineFont,
                      ),
                    ),
                  ),
                  AppliedJobListView(
                    jobsModel: snapshot.data!,
                  ),
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
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
      ),
    );
  }
}
