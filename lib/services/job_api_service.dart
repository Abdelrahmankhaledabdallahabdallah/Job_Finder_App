// Ignore the lint for non-constant identifier names
// ignore_for_file: non_constant_identifier_names

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:job_finder_app/models/apply_job_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/jobs_model.dart';
import '../utils/constants.dart';

import 'dart:convert';

import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

class JobApiService {
  // Function to fetch all jobs data from the server
  static Future<List<JobsModel>> fetchAllJobsData() async {
    // Get the shared preferences instance
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    try {
      // Create a Dio instance for making HTTP requests
      final dio = Dio();

      // Set the authorization header with the user's token
      dio.options.headers['Authorization'] =
          'Bearer ${sharedPreferences.getString(kUserToken)}';

      // Send a GET request to the '/jobs' endpoint
      var response = await dio.get('$baseUrl/jobs');

      // Parse the response body as JSON and extract the 'data' field
      var items = response.data['data'];

      // Create a list of JobsModel objects to store the parsed data
      List<JobsModel> jobs = [];

      // Iterate over each item in the 'data' field and convert it to a JobsModel object
      for (var jobMap in items) {
        try {
          jobs.add(JobsModel.fromJson(jobMap));
        } catch (e) {
          // Log any errors that occur during parsing
          log(e.toString());
        }
      }

      // Return the list of JobsModel objects
      return jobs;
    } catch (e) {
      // Throw an exception if there is an error during the request
      throw Exception(e.toString());
    }
  }

  // Function to fetch a single job data by its ID
  static Future<JobsModel> fetchJobData({required job_id}) async {
    // Get the shared preferences instance
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    // Create an HttpClient instance to handle certificate validation
    HttpClient httpClient = HttpClient();
    httpClient.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);

    // Create an IOClient that uses the HttpClient
    http.Client client = IOClient(httpClient);

    // Send a GET request to the '/jobs/$job_id' endpoint
    final response = await client.get(
      Uri.parse('$baseUrl/jobs/$job_id'),
      // Set the authorization header with the user's token
      headers: {
        'Authorization': 'Bearer ${sharedPreferences.getString(kUserToken)}',
      },
    );

    // If the response status code is 200, parse the response body as JSON and extract the 'data' field
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];

      // Convert the 'data' field to a JobsModel object and return it
      return JobsModel.fromJson(data);
    } else {
      // Otherwise, throw an exception
      throw Exception('Failed to load data');
    }
  }

  // Function to fetch suggested jobs data for the user
  static Future<JobsModel> fetchSuggestedJobsData() async {
    // Get the shared preferences instance
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    // Create an HttpClient instance to handle certificate validation
    HttpClient httpClient = HttpClient();
    httpClient.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);

    // Create an IOClient that uses the HttpClient
    http.Client client = IOClient(httpClient);

    // Send a GET request to the '/jobs/sugest/5' endpoint
    final response = await client.get(
      Uri.parse('$baseUrl/jobs/sugest/5'),
      // Set the authorization header with the user's token
      headers: {
        'Authorization': 'Bearer ${sharedPreferences.getString(kUserToken)}'
      },
    );

    // If the response status code is 200, parse the response body as JSON and extract the 'data' field
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];

      // Convert the 'data' field to a JobsModel object and return it
      return JobsModel.fromJson(data);
    } else {
      // Otherwise, throw an exception
      throw Exception('Failed to load data');
    }
  }

  // Function to apply for a job
  static Future applyJob(
      {required name,
      required email,
      required selectedWorkType,
      required phone,
      required cvFile,
      required otherFile,
      required jobId}) async {
    // Get the shared preferences instance
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    // Create a Dio instance for making HTTP requests
    var dio = Dio();

    // Set the authorization header with the user's token
    dio.options.headers['Authorization'] =
        'Bearer ${sharedPreferences.getString(kUserToken)}';

    // Create a FormData object to store the form data
    FormData formData = FormData.fromMap({
      'cv_file': await MultipartFile.fromFile(cvFile!.path),
      'other_file': await MultipartFile.fromFile(otherFile!.path),
      'name': name,
      'email': email,
      'work_type': selectedWorkType,
      'mobile': phone,
      'jobs_id': jobId,
      'user_id': sharedPreferences.get(kUserId),
    });

    // Store the job ID in shared preferences for later use
    sharedPreferences.setInt(kJobId, jobId);

    // Send a POST request to the '/apply' endpoint
    var response = await dio.post('$baseUrl/apply', data: formData);

    // If the response status code is not 200, log an error message and the response data
    if (response.statusCode != 200) {
      log('Request failed with status code: ${response.statusCode}');
      log('Response data: ${response.data}');
    }
  }

  // Function to fetch the details of the job that the user has successfully applied for
  static Future<JobsModel> fetchSuccessfulApplyingJob() async {
    // Get the shared preferences instance
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    // Create an HttpClient instance to handle certificate validation
    HttpClient httpClient = HttpClient();
    httpClient.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);

    // Create an IOClient that uses the HttpClient
    http.Client client = IOClient(httpClient);

    // Send a GET request to the '/jobs/${sharedPreferences.getInt(kJobId)}' endpoint
    final response = await client.get(
      Uri.parse('$baseUrl/jobs/${sharedPreferences.getInt(kJobId)}'),
      // Set the authorization header with the user's token
      headers: {
        'Authorization': 'Bearer ${sharedPreferences.getString(kUserToken)}'
      },
    );

    // If the response status code is 200, parse the response body as JSON and extract the 'data' field
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];

      // Convert the 'data' field to a JobsModel object and return it
      return JobsModel.fromJson(data);
    } else {
      // Otherwise, throw an exception
      throw Exception('Failed to load job');
    }
  }

  // Function to fetch all the jobs that the user has applied for
  static Future<List<ApplyJobsModel>> fetchAppliedJobs() async {
    // Get the shared preferences instance
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    try {
      // Create a Dio instance for making HTTP requests
      final dio = Dio();

      // Set the authorization header with the user's token
      dio.options.headers['Authorization'] =
          'Bearer ${sharedPreferences.getString(kUserToken)}';

      // Send a GET request to the '/apply/${sharedPreferences.getInt(kUserId)}' endpoint
      var response =
          await dio.get('$baseUrl/apply/${sharedPreferences.getInt(kUserId)}');

      // Parse the response body as JSON and extract the 'data' field
      var items = response.data['data'];

      // Create a list of ApplyJobsModel objects to store the parsed data
      List<ApplyJobsModel> jobs = [];

      // Iterate over each item in the 'data' field and convert it to an ApplyJobsModel object
      for (var jobMap in items) {
        try {
          jobs.add(ApplyJobsModel.fromJson(jobMap));
        } catch (e) {
          // Log any errors that occur during parsing
          log(e.toString());
        }
      }

      // Return the list of ApplyJobsModel objects
      return jobs;
    } catch (e) {
      // Throw an exception if there is an error during the request
      throw Exception(e.toString());
    }
  }

  // Function to search for jobs based on a keyword
  static Future<List<JobsModel>> searchJobs({required String job}) async {
    // Get the shared preferences instance
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    // Create a Dio instance for making HTTP requests
    Dio dio = Dio();

    // Set the authorization header with the user's token
    dio.options.headers['Authorization'] =
        'Bearer ${sharedPreferences.getString(kUserToken)}';

    try {
      // Send a POST request to the '/jobs/search' endpoint with the 'name' parameter set to the search keyword
      final response = await dio.post(
        '$baseUrl/jobs/search',
        data: {
          'name': job,
        },
      );

      // If the response status code is 200, parse the response body as JSON and extract the 'data' field
      if (response.statusCode == 200) {
        var data = response.data['data'];

        // Convert the 'data' field to a list of JobsModel objects and return the list
        List<JobsModel> jobList = List.from(data)
            .map((jobData) => JobsModel.fromJson(jobData))
            .toList();

        return jobList;
      }
    } catch (e) {
      // Log any errors that occur during the request
      log(e.toString());
    }

    // Return an empty list if there is an error or no results are found
    return [];
  }
}
