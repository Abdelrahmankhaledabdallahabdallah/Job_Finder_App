import 'package:bloc/bloc.dart'; //import the bloc library
import 'package:meta/meta.dart'; //import the meta library for annotations
import '../../models/apply_job_model.dart'; //import the ApplyJobsModel class from the models folder
import '../../services/job_api_service.dart'; //import the JobApiService class from the services folder

part 'applied_job_state.dart'; //import the AppliedJobState file

class AppliedJobCubit extends Cubit<AppliedJobState> {
  //define the AppliedJobCubit class which extends the Cubit class and takes AppliedJobState as its generic type
  AppliedJobCubit(this.jobApiService)
      : super(
            AppliedJobInitial()); //constructor for the AppliedJobCubit class which takes the jobApiService as a parameter and sets the initial state to AppliedJobInitial

  JobApiService jobApiService; //declare the jobApiService variable

  List<ApplyJobsModel>?
      jobModel; //declare the jobModel variable of type List<ApplyJobsModel>

  Future<void> fetchAppliedJobs() async {
    //define the fetchAppliedJobs method which returns a Future<void>
    emit(AppliedJobsLoading()); //emit the AppliedJobsLoading state
    try {
      //try to execute the following block of code
      jobModel = await JobApiService
          .fetchAppliedJobs(); //call the fetchAppliedJobs method of the JobApiService class and assign the result to the jobModel variable
      emit(AppliedJobSuccess(
          jobModel!)); //emit the AppliedJobSuccess state with the jobModel as a parameter
    } on Exception catch (e) {
      //catch any exceptions that occur in the try block
      emit(AppliedJobFailure(
          errmessage: e
              .toString())); //emit the AppliedJobFailure state with the error message as a parameter
    }
  }
}
