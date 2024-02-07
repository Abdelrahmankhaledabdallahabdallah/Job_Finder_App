// Importing required libraries for HTTP requests, logging, and shared preferences.
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:http/io_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Importing constants from a separate file.
import '../../utils/constants.dart';

// Defining the different states the LoginCubit can be in.
part 'login_state.dart';

// The LoginCubit class extends the Cubit class and handles the login functionality.
class LoginCubit extends Cubit<LoginState> {
  // The initial state of the LoginCubit is LoginInitial.
  LoginCubit() : super(LoginInitial());

  // The login method takes email and password as required parameters.
  Future<void> login({required String email, required String password}) async {
    // Setting the state to LoginLoading to indicate that the login process has started.
    emit(LoginLoading());

    try {
      // Getting an instance of SharedPreferences to store the user token.
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      // Creating an HttpClient object to allow us to bypass SSL certificate validation.
      HttpClient httpClient = HttpClient();
      httpClient.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);

      // Creating an IOClient object using the HttpClient.
      Client client = IOClient(httpClient);

      // Making a POST request to the login endpoint with the provided email and password.
      final response = await client.post(Uri.parse('$baseUrl/auth/login'),
          body: {'email': email, 'password': password});

      // Checking the status code of the response.
      if (response.statusCode == 200) {
        // If the status code is 200, we decode the response body and extract the token.
        var data = jsonDecode(response.body.toString());
        log('data in the cubit login ${data.toString()}');
        log(data['token']);
        // Storing the token in SharedPreferences.
        sharedPreferences.setString(kUserToken, data['token']);

        // Setting the state to LoginSuccess to indicate that the login was successful.
        emit(LoginSuccess());
      } else {
        // If the status code is not 200, we log an error message.
        log('failed');
        // Setting the state to LoginFailure with an error message.
        LoginFailure(errMessage: "failed");
      }
    } catch (e) {
      // If an error occurs, we log the error message and set the state to LoginFailure.
      log('an error in login cubit ${e.toString()}');
      LoginFailure(errMessage: e.toString());
    }
  }
}
