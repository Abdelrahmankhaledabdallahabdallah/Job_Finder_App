import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_finder_app/cubits/home_cubits/recent_jobs_cubit/recent_jobs_cubit.dart';
import 'package:job_finder_app/screens/home/widgets/recent_job_list_view.dart';

class RecentJobViewFutureBuilder extends StatelessWidget {
  const RecentJobViewFutureBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<RecentJobsCubit>().fetchRecentJobs();

    return BlocBuilder<RecentJobsCubit, RecentJobsState>(
      builder: (context, state) {
        if (state is RecentJobsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is RecentJobsSuccess) {
          return RecentJobListView(jobsModel: state.jobs);
        } else {
          return const Center(
            child: Text(
              'Something went wrong!',
              style: TextStyle(color: Colors.red),
            ),
          );
        }
      },
    );
  }
}
