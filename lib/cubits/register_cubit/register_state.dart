// This is a part of the RegisterCubit file
part of 'register_cubit.dart';

// This is an abstract class that represents the possible states of the RegisterCubit.
@immutable
abstract class RegisterState {}

// This is the initial state of the RegisterCubit.
class RegisterInitial extends RegisterState {}

// This is the state that represents when the RegisterCubit is loading.
class RegisterLoading extends RegisterState {}

// This is the state that represents when the RegisterCubit has successfully registered a user.
class RegisterSuccess extends RegisterState {}

// This is the state that represents when the RegisterCubit has failed to register a user.
class RegisterFailure extends RegisterState {
  // This is the error message that is associated with the failure.
  final String errmessage;

  // This is the constructor for the RegisterFailure state.
  RegisterFailure({required this.errmessage});
}
