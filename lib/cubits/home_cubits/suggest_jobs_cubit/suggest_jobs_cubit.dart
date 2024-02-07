// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

// Importing the required models and services
import '../../../models/jobs_model.dart';
import '../../../services/job_api_service.dart';

// Generating the SuggestJobsState class
part 'suggest_jobs_state.dart';

// Defining the SuggestJobsCubit class, which extends the Cubit class
// with the SuggestJobsState as its generic type
class SuggestJobsCubit extends Cubit<SuggestJobsState> {
  // Initializing the SuggestJobsCubit with the SuggestJobsInitial state
  SuggestJobsCubit() : super(SuggestJobsInitial());

  // Define a JobApiService object
  // JobApiService jobApiService;

  // Define a JobsModel object
  // JobsModel? jobModel;

  // Defining the fetchSuggestJobs method, which is an asynchronous function
  // that returns a Future<void>
  Future<void> fetchSuggestJobs() async {
    // Emitting the SuggestJobsLoading state to indicate that the data is being loaded
    emit(SuggestJobsLoading());

    try {
      // Fetching the suggested jobs data from the JobApiService
      JobsModel jobModel = await JobApiService.fetchSuggestedJobsData();

      // Adding a debug log to see the response in the console
      print("Fetched Suggested Jobs Data: $jobModel");

      // Emitting the SuggestJobsSuccess state with the fetched job model
      emit(SuggestJobsSuccess(jobModel));
    } catch (e) {
      // Emitting the SuggestJobsFailure state with an error message
      emit(SuggestJobsFailure(
          "Failed to fetch data. Please check your internet connection."));
    }
  }
}
