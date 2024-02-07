part of 'applied_job_cubit.dart';

// This is the base class for all states of the AppliedJobCubit.
// It is marked as immutable to ensure that the state cannot be mutated after it has been created.
@immutable
abstract class AppliedJobState {}

// This is the initial state of the AppliedJobCubit.
// It indicates that the cubit has not yet been initialized.
class AppliedJobInitial extends AppliedJobState {}

// This state indicates that the cubit is currently loading applied jobs.
class AppliedJobsLoading extends AppliedJobState {}

// This state indicates that the cubit has successfully loaded applied jobs.
// The list of applied jobs is passed as a parameter to the constructor.
class AppliedJobSuccess extends AppliedJobState {
  final List<ApplyJobsModel> jobs;
  AppliedJobSuccess(this.jobs);
}

// This state indicates that the cubit has failed to load applied jobs.
// The error message is passed as a parameter to the constructor.
class AppliedJobFailure extends AppliedJobState {
  final String errmessage;
  AppliedJobFailure({required this.errmessage});
}
