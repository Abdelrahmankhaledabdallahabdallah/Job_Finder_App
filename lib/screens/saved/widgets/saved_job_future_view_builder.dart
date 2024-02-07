import 'package:flutter/material.dart';
import 'package:job_finder_app/screens/saved/widgets/saved_list_view.dart';
import 'package:job_finder_app/services/favorites_api_service.dart';

import '../../../utils/app_fonts.dart';
import 'no_saved_jobs.dart';

class SavedJobViewFutureBuilder extends StatefulWidget {
  const SavedJobViewFutureBuilder({super.key});

  @override
  State<SavedJobViewFutureBuilder> createState() =>
      _SavedJobViewFutureBuilderState();
}

class _SavedJobViewFutureBuilderState extends State<SavedJobViewFutureBuilder> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FavoritesApiService.fetchAllFavoritesJobs(),
      builder: (context, snapshot) {
        if ((snapshot.data?.isEmpty ?? true)) {
          return const NoSavedJobs();
        } else {
          const Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasError) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  color: const Color(0xffE5E7EB),
                  child: Text(
                    '${snapshot.data!.length} Job Saved',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xff6B7280),
                      fontSize: 14,
                      fontFamily: AppFonts.kLoginHeadlineFont,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SavedListView(jobsModel: snapshot.data!),
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
    );
  }
}
