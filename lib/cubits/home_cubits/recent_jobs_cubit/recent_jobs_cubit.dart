import 'package:bloc/bloc.dart';
import 'package:job_finder_app/models/jobs_model.dart'; //Importing the JobsModel class from the models folder
import 'package:job_finder_app/services/job_api_service.dart'; //Importing the JobApiService class from the services folder
import 'package:meta/meta.dart';
part 'recent_jobs_state.dart';

// This class extends the Cubit class and takes in a JobApiService as a parameter.
class RecentJobsCubit extends Cubit<RecentJobsState> {
  RecentJobsCubit(this.jobApiService)
      : super(
            RecentJobsInitial()); //It initializes the state with RecentJobsInitial()

  JobApiService jobApiService;

  List<JobsModel>?
      jobModel; //This is a list that will store the JobsModel objects.

  //This method fetches the recent jobs data from the API.
  Future<List<JobsModel>?> fetchRecentJobs() async {
    // It emits the RecentJobsLoading state to indicate that the data is being loaded.
    emit(RecentJobsLoading());
    try {
      // It calls the fetchAllJobsData() method from the JobApiService to fetch the data from the API.
      jobModel = await JobApiService.fetchAllJobsData();

      // It emits the RecentJobsSuccess state and passes in the list of JobsModel objects.
      emit(RecentJobsSuccess(jobModel!));
    } on Exception catch (e) {
      // It emits the RecentJobsFailure state and passes in the error message.
      emit(RecentJobsFailure(e.toString()));
    }
    // It returns null to indicate that the method does not return anything.
    return null;
  }
}
