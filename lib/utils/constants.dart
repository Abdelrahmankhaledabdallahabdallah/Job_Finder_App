// Import the necessary libraries.
import 'package:shared_preferences/shared_preferences.dart';

// Define the constants for the collection names and the user's preferences.
const kUsersCollections = 'users';
const kKeepMeLoggedIn = 'keepMeLoggedIn';
const kUserId = 'userId';
const kUserName = 'userName';

// Define the constants for the job details.
const kJobId = 'jobId';
const kUserToken = 'userToken';

// Define the base URL for the API requests.
const baseUrl = 'https://project2.amit-learning.com/api';

// Define the constants for the user's email and the filled status.
const kEmail = 'email';
const kisFilled = 'email';

// Define the constants for the collection names.
const kMessagesCollections = 'messages';
const kCompanyCollections = 'company';
const kMessage = 'message';

// Define the constants for the saved jobs and the image URL.
const kSavedJobs = 'savedJobs';
const kImgUrl = 'imgUrl';

/// Formats the salary by replacing the last three characters with 'K' if it ends with '000'.
String showSalary(String salary) {
  // Check if the salary ends with '000'.
  if (salary.endsWith('000')) {
    // Replace the last three characters with 'K'.
    salary = salary.replaceRange(2, 5, 'K');
  }

  // Return the formatted salary.
  return salary;
}

/// Formats the location by removing the last two characters if they are a period and a space.
String showLocation(String word) {
  // Split the word into a list of strings.
  List<String> splitted = word.split(" ");

  // Get the last two strings from the list.
  List<String> smaller = splitted.sublist(splitted.length - 2, splitted.length);

  // Join the last two strings into a single string.
  word = smaller.join(" ").replaceAll('.', '');

  // Return the formatted word.
  return word;
}

/// Removes the user's email from the shared preferences.
Future<void> removeEmailFromSharedPreferences() async {
  // Get an instance of the shared preferences.
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  // Remove the user's email from the shared preferences.
  sharedPreferences.remove(kEmail);
}

/// Converts a timestamp to the number of days since the timestamp was created.
int convertTime(String time) {
  // Parse the timestamp into a DateTime object.
  DateTime timestamp = DateTime.parse(time);

  // Get the current time.
  DateTime now = DateTime.now();

  // Calculate the difference between the timestamp and the current time.
  Duration difference = now.difference(timestamp);

  // Get the difference in days.
  int daysDifference = difference.inDays;

  // Return the difference in days.
  return daysDifference;
}

/// Extension method to capitalize the first letter of a string.
extension StringExtensions on String {
  String capitalize() {
    // Capitalize the first letter of the string.
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
