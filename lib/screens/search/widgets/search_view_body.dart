import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_finder_app/screens/search/widgets/search_list_view.dart';
import '../../../cubits/home_cubits/search_jobs_cubit/search_jobs_cubit.dart';
import '../../../utils/app_fonts.dart';
import '../../../utils/app_images.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchJobsCubit, SearchJobsState>(
      builder: (context, state) {
        if (state is SearchJobsSuccess) {
          if (state.jobs.isNotEmpty) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: double.infinity,
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: const BoxDecoration(
                      color: Color(0xffE5E7EB),
                    ),
                    child: Text(
                      "Featuring ${state.jobs.length} jobs",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xff6B7280),
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SearchListView(
                    jobs: state.jobs,
                  )
                ],
              ),
            );
          } else {
            return Padding(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.2,
              ),
              child: Column(
                children: [
                  Image.asset(AppImages.kSearchIlustration),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Search not found',
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: AppFonts.kRegisterHeadlineFont,
                      color: Color(0xff111827),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Try searching with different keywords so\n we can show you',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff6B7280),
                        fontFamily: AppFonts.kRegisterHintFont,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            );
          }
        } else if (state is SearchJobsFailure) {
          return Text('Search Failed: ${state.errMessage}');
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
