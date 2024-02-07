// ignore_for_file: non_constant_identifier_names
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/constants.dart';

class ApplyJobsModel {
  // This variable will hold the path to the user's CV file.
  String? cv_file;

  // This variable will hold the user's name.
  String? name;

  // This variable will hold the user's email address.
  String? email;

  // This variable will hold the user's mobile number.
  String? mobile;

  // This variable will hold the type of work the user is applying for.
  String? work_type;

  // This variable will hold the path to any other files the user wants to submit with their application.
  String? other_file;

  // This variable will hold the ID of the user who is applying for the job.
  int? user_id;

  // This variable will hold the ID of the job that the user is applying for.
  int? jobs_id;

  // This constructor initializes all of the class variables.
  ApplyJobsModel({
    this.cv_file,
    this.name,
    this.email,
    this.mobile,
    this.work_type,
    this.other_file,
    this.user_id,
    this.jobs_id,
  });

  // This factory constructor creates an instance of the ApplyJobsModel class from a JSON object.
  factory ApplyJobsModel.fromJson(Map<String, dynamic> json) {
    return ApplyJobsModel(
      cv_file: json['cv_file'],
      name: json['name'],
      email: json['email'],
      mobile: json['mobile'],
      work_type: json['work_type'],
      other_file: json['other_file'],
      user_id: json['user_id'],
      jobs_id: json['jobs_id'],
    );
  }

  // This method converts the ApplyJobsModel class to a JSON object.
  Future<Map<String, dynamic>> toJson() async {
    // Get the shared preferences instance.
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();

    // Create a map to store the JSON data.
    return {
      'cv_file': cv_file,
      'name': name,
      'email': email,
      'mobile': mobile,
      'work_type': work_type,
      'other_file': other_file,
      'user_id': sharedPrefs.getInt(kUserId),
      'jobs_id': jobs_id,
    };
  }
}
