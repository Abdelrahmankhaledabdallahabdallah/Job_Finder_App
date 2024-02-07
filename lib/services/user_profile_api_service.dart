import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart';
import 'package:http/io_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/constants.dart';
import '../models/user_portofolio_model.dart';

// This class provides API services related to user profile and portofolios.
class UserProfileApiService {
  // This method adds a user's image to their portofolio.
  static Future<void> addUserImage({required File image}) async {
    // Try to execute the following code.
    try {
      // Get the shared preferences instance.
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

      // Create an HttpClient instance and set the bad certificate callback to accept all certificates.
      HttpClient httpClient = HttpClient();
      httpClient.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);

      // Create an IOClient using the HttpClient.
      Client client = IOClient(httpClient);

      // Define the URL for adding a user's image.
      const url = '$baseUrl/user/profile/portofolios';

      // Make a POST request to the URL with the image as the body.
      final response = await client.post(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer ${sharedPreferences.get(kUserToken)}',
        },
        body: {'image': image},
      );

      // If the response status code is 200 (OK), then decode the response body.
      if (response.statusCode == 200) {
        json.decode(response.body);
      }
    } catch (e) {
      // If an error occurs, print the error message to the console.
      log('error = ${e.toString()}');
    }
  }

  // This method fetches the user's portofolio.
  static Future<UserPortofolioModel?> fetchUserPortofolio() async {
    // Create an HttpClient instance and set the bad certificate callback to accept all certificates.
    HttpClient httpClient = HttpClient();
    httpClient.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);

    // Create an IOClient using the HttpClient.
    Client client = IOClient(httpClient);

    // Get the shared preferences instance.
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    // Make a GET request to the URL for getting the user's portofolio.
    final response = await client.get(
      Uri.parse('$baseUrl/user/profile/portofolios'),
      headers: {
        'Authorization': 'Bearer ${sharedPreferences.get(kUserToken)}',
      },
    );

    // If the response status code is 200 (OK), then parse the response body.
    if (response.statusCode == 200) {
      // Get the 'data' field from the JSON response.
      final data = jsonDecode(response.body)['data']['portfolio'];

      // Check if 'portfolio' is a list. If it is a list, convert it to a list of UserPortofolioModel objects.
      if (data is List) {
        // Parse the data into a list of UserPortofolioModel objects.
        List<UserPortofolioModel> users = List<UserPortofolioModel>.from(
            data.map((item) => UserPortofolioModel.fromJson(item)));

        // Return the first element of the list, if it is not empty.
        return users.isNotEmpty ? users.first : null;
      } else {
        // Handle the case where 'portfolio' is not a list.
        throw Exception('Invalid data format for portfolio');
      }
    } else if (response.statusCode == 404) {
      // If the response status code is 404 (Not Found), then return null.
      log('here no data');
      return null;
    } else {
      // If the response status code is not 200 or 404, then throw an exception.
      throw Exception('Failed to load data');
    }
  }
}
