import 'package:bloc/bloc.dart'; // Import the bloc library
import 'package:job_finder_app/services/job_api_service.dart'; // Import the job api service
import 'package:meta/meta.dart'; // Import the meta library

import '../../../models/jobs_model.dart'; // Import the jobs model

part 'search_jobs_state.dart'; // Import the search jobs state file

// Define the SearchJobsCubit class, which extends the Cubit class and takes a SearchJobsState as its state type.
class SearchJobsCubit extends Cubit<SearchJobsState> {
  // Initialize the SearchJobsCubit with the initial state, SearchJobsInitial(), in the constructor.
  SearchJobsCubit() : super(SearchJobsInitial());

  // Define the searchJobs method, which takes a required parameter job of type String.
  Future<List<JobsModel>> searchJobs({required String job}) async {
    // Emit the SearchJobsLoading state to indicate that the search is in progress.
    emit(SearchJobsLoading());

    // Try to search for jobs using the JobApiService.searchJobs method.
    try {
      List<JobsModel> jobModel = await JobApiService.searchJobs(job: job);

      // If the search is successful, emit the SearchJobsSuccess state with the list of jobs.
      emit(SearchJobsSuccess(jobModel));
    } // Catch any exceptions that may occur during the search process.
    on Exception catch (e) {
      // Emit the SearchJobsFailure state with the error message.
      emit(SearchJobsFailure(e.toString()));
    }

    // Return an empty list as a placeholder.
    return [];
  }
}
