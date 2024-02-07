// This is a part of the SuggestJobsCubit file.
part of 'suggest_jobs_cubit.dart';

// The SuggestJobsState class is an abstract class that represents the state of the SuggestJobsCubit.
@immutable
abstract class SuggestJobsState {}

// The SuggestJobsInitial class is a concrete implementation of the SuggestJobsState class that represents the initial state of the SuggestJobsCubit.
class SuggestJobsInitial extends SuggestJobsState {}

// The SuggestJobsLoading class is a concrete implementation of the SuggestJobsState class that represents the loading state of the SuggestJobsCubit.
class SuggestJobsLoading extends SuggestJobsState {}

// The SuggestJobsSuccess class is a concrete implementation of the SuggestJobsState class that represents the success state of the SuggestJobsCubit.
// It contains the JobsModel object that represents the list of suggested jobs.
class SuggestJobsSuccess extends SuggestJobsState {
  final JobsModel jobs;
  SuggestJobsSuccess(this.jobs);
}

// The SuggestJobsFailure class is a concrete implementation of the SuggestJobsState class that represents the failure state of the SuggestJobsCubit.
// It contains the errorMessage that represents the error message that occurred.
class SuggestJobsFailure extends SuggestJobsState {
  final String errMessage;
  SuggestJobsFailure(this.errMessage);
}
