import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_finder_app/screens/search/widgets/search_bar_view_future_builder.dart';

import '../../../cubits/home_cubits/search_jobs_cubit/search_jobs_cubit.dart';
import '../../home/views/home_view.dart';
import '../widgets/custom_search_bar.dart';
import '../widgets/search_view_body.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  String searchValue = "";
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 16.0,
                  left: 8.0,
                  top: 20.0,
                  bottom: 20.0,
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const HomeView();
                            },
                          ),
                        );
                      },
                    ),
                    Expanded(
                      child: CustomSearchBar(
                        ontap: () {
                          setState(() {
                            searchValue = "";
                            controller.clear();
                          });
                        },
                        controller: controller,
                        onChanged: (value) {
                          setState(() {
                            searchValue = value!;
                            BlocProvider.of<SearchJobsCubit>(context)
                                .searchJobs(job: searchValue);
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              searchValue.isEmpty
                  ? const SearchBarViewFutureBuilder()
                  : const SearchViewBody(),
            ],
          ),
        ),
      ),
    );
  }
}
