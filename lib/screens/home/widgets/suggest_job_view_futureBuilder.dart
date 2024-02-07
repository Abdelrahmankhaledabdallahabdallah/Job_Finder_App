// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_finder_app/cubits/home_cubits/suggest_jobs_cubit/suggest_jobs_cubit.dart';
import 'package:job_finder_app/screens/home/widgets/suggest_job.dart';

import '../../job_details/views/job_details_view.dart';

class SuggestJobViewFutureBuilder extends StatefulWidget {
  const SuggestJobViewFutureBuilder({super.key});

  @override
  State<SuggestJobViewFutureBuilder> createState() =>
      _SuggestJobViewFutureBuilderState();
}

class _SuggestJobViewFutureBuilderState
    extends State<SuggestJobViewFutureBuilder> {
  @override
  Widget build(BuildContext context) {
    context.read<SuggestJobsCubit>().fetchSuggestJobs();

    return BlocBuilder<SuggestJobsCubit, SuggestJobsState>(
      builder: (context, state) {
        if (state is SuggestJobsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is SuggestJobsSuccess) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return JobDetailsView(
                      job: state.jobs,
                    );
                  },
                ),
              );
            },
            child: SuggestJob(job: state.jobs),
          );
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
