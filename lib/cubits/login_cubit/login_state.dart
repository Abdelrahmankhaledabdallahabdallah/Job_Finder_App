// This file is a part of the 'login_cubit.dart' file.
part of 'login_cubit.dart';

// The @immutable annotation indicates that the LoginState class
// cannot be modified after it has been created.
@immutable
// The LoginState class is an abstract class,
// meaning it cannot be instantiated directly.
// It defines the various states that the LoginCubit can be in.
abstract class LoginState {}

// The LoginInitial class represents the initial state of the LoginCubit.
class LoginInitial extends LoginState {}

// The LoginSuccess class represents the state when the user has successfully logged in.
class LoginSuccess extends LoginState {}

// The LoginLoading class represents the state when the LoginCubit is loading data.
class LoginLoading extends LoginState {}

// The LoginFailure class represents the state when the user has failed to log in.
class LoginFailure extends LoginState {
  // The errMessage field stores the error message that occurred during login.
  final String errMessage;

  // The LoginFailure constructor takes a required errMessage parameter.
  LoginFailure({required this.errMessage});
}
