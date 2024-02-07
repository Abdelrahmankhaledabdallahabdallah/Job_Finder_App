import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_finder_app/cubits/home_cubits/search_jobs_cubit/search_jobs_cubit.dart';
import 'package:job_finder_app/screens/search/widgets/search_bar_list_view.dart';
import 'package:job_finder_app/services/job_api_service.dart';

class SearchBarViewFutureBuilder extends StatelessWidget {
  const SearchBarViewFutureBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchJobsCubit, SearchJobsState>(
      builder: (context, state) {
        return FutureBuilder(
          future: JobApiService.fetchAllJobsData(),
          builder: (context, snapshot) {
            if (!snapshot.hasError) {
              if (snapshot.connectionState == ConnectionState.done) {
                return SearchBarListView(jobsModel: snapshot.data!);
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
        );
      },
    );
  }
}
