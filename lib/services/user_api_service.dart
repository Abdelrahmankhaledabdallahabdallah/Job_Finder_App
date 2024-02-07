import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart';
import 'package:http/io_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/constants.dart';
import '../models/user_model.dart';
import '../utils/shared_prefs.dart';

// This class is responsible for handling all the API calls related to user operations.
class UserApiService {
  // This method is used to fetch the user data from the server.
  static Future<UserModel> fetchUserData() async {
    // Get the shared preferences instance to access the saved token.
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    // Create an HttpClient object and set the bad certificate callback to allow self-signed certificates.
    HttpClient httpClient = HttpClient();
    httpClient.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);

    // Create an IOClient object using the HttpClient.
    Client client = IOClient(httpClient);

    // Send a GET request to the server to fetch the user data.
    final response = await client.get(
      Uri.parse('$baseUrl/auth/profile'),
      // Set the Authorization header using the saved token.
      headers: {
        'Authorization': 'Bearer ${sharedPreferences.get(kUserToken)}',
      },
    );

    // Log the response status code to the console.
    log(response.statusCode.toString());

    // If the response status code is 200, indicating success, proceed to parse the response.
    if (response.statusCode == 200) {
      // Decode the response body and extract the data field.
      var data = jsonDecode(response.body)['data'];

      // Log the decoded data to the console.
      log(jsonEncode(data));

      // Log the saved token to the console.
      log(sharedPreferences.getString(kUserToken).toString());

      // Log the user ID from the data to the console.
      log(jsonEncode(data['id']));

      // Save the user ID in the shared preferences.
      sharedPreferences.setInt(kUserId, data['id']);

      // Update the username in the SharedPrefs class.
      SharedPrefs().username = data['name'];

      // Log the updated username to the console.
      log('name = ${SharedPrefs().username}');

      // Create a UserModel object from the decoded data.
      UserModel user = UserModel.fromJson(data);

      // Return the UserModel object.
      return user;
    }
    // If the response status code is not 200, throw an exception.
    else {
      throw Exception('Error');
    }
  }

  // This method is used to send an OTP to the user's email address.
  static Future<void> getOtp({required String email}) async {
    try {
      // Create an HttpClient object and set the bad certificate callback to allow self-signed certificates.
      HttpClient httpClient = HttpClient();
      httpClient.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);

      // Create an IOClient object using the HttpClient.
      Client client = IOClient(httpClient);

      // Set the URL for the OTP endpoint.
      const url = '$baseUrl/auth/otp';

      // Send a POST request to the server to send the OTP.
      final response = await client.post(
        Uri.parse(url),
        // Set the email in the request body.
        body: {
          'email': email,
        },
      );

      // If the response status code is 200, indicating success, proceed to decode the response.
      if (response.statusCode == 200) {
        // Decode the response body.
        json.decode(response.body);
      }
    } catch (e) {
      // Log any errors that occur during the process.
      log('error = ${e.toString()}');
    }
  }

  // This method is used to update the user's password.
  static Future<void> updatePassword({required String password}) async {
    try {
      // Get the shared preferences instance to access the saved token.
      SharedPreferences preferences = await SharedPreferences.getInstance();

      // Create an HttpClient object and set the bad certificate callback to allow self-signed certificates.
      HttpClient httpClient = HttpClient();
      httpClient.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);

      // Create an IOClient object using the HttpClient.
      Client client = IOClient(httpClient);

      // Set the URL for the update password endpoint.
      const url = '$baseUrl/auth/user/update';

      // Send a POST request to the server to update the password.
      final response = await client.post(
        Uri.parse(url),
        // Set the Authorization header using the saved token.
        headers: {
          'Authorization': 'Bearer ${preferences.getString(kUserToken)}',
        },
        // Set the password in the request body.
        body: {
          'password': password,
        },
      );

      // If the response status code is 200, indicating success, proceed to decode the response.
      if (response.statusCode == 200) {
        // Decode the response body.
        json.decode(response.body);
      }
    } catch (e) {
      // Log any errors that occur during the process.
      log('error = ${e.toString()}');
    }
  }
}
