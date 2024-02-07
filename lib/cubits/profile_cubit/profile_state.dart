// Define the different states that the ProfileCubit can be in
part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

// The initial state of the cubit
class ProfileInitial extends ProfileState {}

// The state when the profile data is successfully loaded
class ProfileSuccess extends ProfileState {
  final UserPortofolioModel userPortofolio; // Replace with your data model
  ProfileSuccess({required this.userPortofolio});
}

// The state when the profile data is being loaded
class ProfileLoading extends ProfileState {}

// The state when there is no profile data to show
class ProfileNoData extends ProfileState {}

// The state when there is an error loading the profile data
class ProfileFailure extends ProfileState {
  final String errMessage;
  ProfileFailure({required this.errMessage});
}
