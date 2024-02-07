// This is a part of the file search_jobs_cubit.dart
part of 'search_jobs_cubit.dart';

// This class represents the different states that the search jobs cubit can be in.
@immutable
abstract class SearchJobsState {}

// This state represents the initial state of the cubit, before any search has been performed.
class SearchJobsInitial extends SearchJobsState {}

// This state represents the state of the cubit while a search is being performed.
class SearchJobsLoading extends SearchJobsState {}

// This state represents the state of the cubit when the search has been successful and jobs have been found.
class SearchJobsSuccess extends SearchJobsState {
  // This field stores the list of jobs that were found by the search.
  final List<JobsModel> jobs;
  // The constructor for this state takes the list of jobs as an argument.
  SearchJobsSuccess(this.jobs);
}

// This state represents the state of the cubit when the search has failed and no jobs were found.
class SearchJobsFailure extends SearchJobsState {
  // This field stores the error message that was returned by the search.
  final String errMessage;
  // The constructor for this state takes the error message as an argument.
  SearchJobsFailure(this.errMessage);
}
