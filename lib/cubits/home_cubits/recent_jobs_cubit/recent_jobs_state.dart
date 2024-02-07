// This is a part of the RecentJobsCubit file
part of 'recent_jobs_cubit.dart';

// This is an immutable class that represents the state of the RecentJobsCubit.
@immutable
abstract class RecentJobsState {}

// This is the initial state of the RecentJobsCubit.
class RecentJobsInitial extends RecentJobsState {}

// This state represents that the RecentJobsCubit is loading data.
class RecentJobsLoading extends RecentJobsState {}

// This state represents that the RecentJobsCubit has successfully loaded data.
class RecentJobsSuccess extends RecentJobsState {
  // This is the list of jobs that were loaded.
  final List<JobsModel> jobs;

  // This constructor takes the list of jobs as a parameter.
  RecentJobsSuccess(this.jobs);
}

// This state represents that the RecentJobsCubit has failed to load data.
class RecentJobsFailure extends RecentJobsState {
  // This is the error message that was received.
  final String errMessage;

  // This constructor takes the error message as a parameter.
  RecentJobsFailure(this.errMessage);
}
