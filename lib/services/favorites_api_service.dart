import 'package:dio/dio.dart';
import 'package:job_finder_app/models/favorites_jobs_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/jobs_model.dart';
import '../utils/constants.dart';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart';
import 'package:http/io_client.dart';

class FavoritesApiService {
  // ignore: non_constant_identifier_names
  static Future<List<FavoritesJobsModel>> fetchAllFavoritesJobs() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    final dio = Dio();
    // ignore: non_constant_identifier_names
    dio.options.headers['Authorization'] =
        'Bearer ${sharedPreferences.getString(kUserToken)}';
    try {
      var response = await dio.get('$baseUrl/favorites');

      if (response.statusCode == 200) {
        var items = response.data['data'];
        List<FavoritesJobsModel> jobs = [];
        for (var jobMap in items) {
          jobs.add(FavoritesJobsModel.fromJson(jobMap));
        }

        return jobs;
      } else if (response.statusCode == 404) {
        // Handle the case where there is no data
        return [];
      } else {
        // Handle other error cases
        throw Exception(
            'Failed to load favorites jobs. Status code: ${response.statusCode}');
      }
    } on DioError catch (e) {
      // Handle DioExceptions here
      if (e.response?.statusCode == 404) {
        // Handle the case where there is no data
        return [];
      } else {
        // Handle other DioError cases
        throw Exception('Failed to load favorites jobs: ${e.message}');
      }
    }
  }

  // ignore: non_constant_identifier_names
  static Future<void> addFavoritesJobs({required job_id}) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      HttpClient httpClient = HttpClient();
      httpClient.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
      Client client = IOClient(httpClient);

      const url = '$baseUrl/favorites';
      final response = await client.post(
        Uri.parse(url),
        body: {
          'job_id': job_id,
        },
        headers: {
          'Authorization': 'Bearer ${sharedPreferences.getString(kUserToken)}',
        },
      );

      if (response.statusCode == 200) {
        json.decode(response.body);
      }
    } catch (e) {
      log('error = ${e.toString()}');
    }
  }

  static Dio dio = Dio();

  // ignore: non_constant_identifier_names
  static Future<void> cancelSaveFavoriteJob(FavoritesJobsModel job) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    dio.options.headers['Authorization'] =
        'Bearer ${sharedPreferences.getString(kUserToken)}';

    try {
      var response = await dio.delete('$baseUrl/favorites/${job.id}');

      if (response.statusCode == 200) {
        print('Job removed from favorites');
      } else {
        print('Failed to remove job from favorites');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  // ignore: non_constant_identifier_names
  static Future<void> deleteFavoriteJob(String id) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      HttpClient httpClient = HttpClient();
      httpClient.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
      Client client = IOClient(httpClient);

      String url = '$baseUrl/favorites/$id';
      final response = await client.delete(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer ${sharedPreferences.getString(kUserToken)}',
        },
      );

      if (response.statusCode == 200) {
        json.decode(response.body);
      }
    } catch (e) {
      log('error = ${e.toString()}');
    }
  }

  // ignore: non_constant_identifier_names
  static void deleteJob(JobsModel jobToDelete) async {
    List<FavoritesJobsModel> favoriteJobs =
        await FavoritesApiService.fetchAllFavoritesJobs();

    for (var favoriteJob in favoriteJobs) {
      if (favoriteJob.job_name == jobToDelete.name) {
        // if the job in the list matches the job to delete, delete it
        await FavoritesApiService.deleteFavoriteJob(favoriteJob.id.toString());
        break;
      }
    }
  }
}

JobsModel convertFavoriteToJob(FavoritesJobsModel favoriteJob) {
  return JobsModel(
    id: favoriteJob.job_id,
    name: favoriteJob.job_name,
    image: favoriteJob.job_image,
    comp_name: favoriteJob.comp_name,
    location: favoriteJob.location,
  );
}
