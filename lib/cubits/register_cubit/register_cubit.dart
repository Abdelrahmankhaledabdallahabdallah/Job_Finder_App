import 'dart:convert';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:job_finder_app/utils/constants.dart';
import 'package:meta/meta.dart';
import '../../models/user_model.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

// this function is used to register the user
  Future<void> registerUser(UserModel user) async {
    // emitting the loading state
    emit(RegisterLoading());
    try {
      // creating a new http client
      http.Client client = http.Client();
      // creating the url for the api
      const url = '$baseUrl/auth/register';
      // making a post request to the api with the user data
      final response = await client.post(Uri.parse(url), body: user.toJson());

      // checking if the status code is 200, which means that the request was successful
      if (response.statusCode == 200) {
        // decoding the response body to a map
        // ignore: unused_local_variable
        Map<String, dynamic> data = jsonDecode(response.body.toString());

        // emitting the success state
        emit(RegisterSuccess());
      }
    } catch (e) {
      // logging the error to the console
      log('error = ${e.toString()}');
      // emitting the failure state with the error message
      emit(RegisterFailure(errmessage: 'An error occurred ${e.toString()}.'));
    }
  }
}
