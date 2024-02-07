import 'package:shared_preferences/shared_preferences.dart'; //import the shared_preferences package

import 'constants.dart'; //import the constants file

class SharedPrefs {
  static late SharedPreferences
      _sharedPrefs; //declare a static late variable to store the SharedPreferences instance

  factory SharedPrefs() => SharedPrefs
      ._internal(); //factory constructor to enforce singleton pattern

  SharedPrefs._internal(); //private constructor to prevent direct instantiation

  Future<void> init() async {
    //async method to initialize the SharedPreferences instance
    _sharedPrefs = await SharedPreferences
        .getInstance(); //get the SharedPreferences instance
  }

  int get userId =>
      _sharedPrefs.getInt(kUserId) ??
      0; //getter for userId, returns 0 if not set

  set userId(int value) {
    //setter for userId
    _sharedPrefs.setInt(kUserId, value); //set the userId in SharedPreferences
  }

  int get jobId =>
      _sharedPrefs.getInt(kJobId) ?? 0; //getter for jobId, returns 0 if not set

  set jobId(int value) {
    //setter for jobId
    _sharedPrefs.setInt(kJobId, value); //set the jobId in SharedPreferences
  }

  String get token =>
      _sharedPrefs.getString(kUserToken) ??
      ""; //getter for token, returns empty string if not set

  set token(String value) {
    //setter for token
    _sharedPrefs.setString(kUserId, value); //set the token in SharedPreferences
  }

  String get email =>
      _sharedPrefs.getString(kEmail) ??
      ""; //getter for email, returns empty string if not set

  set email(String value) {
    //setter for email
    _sharedPrefs.setString(kEmail, value); //set the email in SharedPreferences
  }

  void removeEmail() {
    //method to remove email from SharedPreferences
    _sharedPrefs.remove(kEmail); //remove the email key from SharedPreferences
  }

  String get imgUrl =>
      _sharedPrefs.getString(kImgUrl) ??
      ""; //getter for imgUrl, returns empty string if not set

  set imgUrl(String value) {
    //setter for imgUrl
    _sharedPrefs.setString(
        kImgUrl, value); //set the imgUrl in SharedPreferences
  }

  String get username =>
      _sharedPrefs.getString(kUserName) ??
      ""; //getter for username, returns empty string if not set

  set username(String value) {
    //setter for username
    _sharedPrefs.setString(
        kUserName, value); //set the username in SharedPreferences
  }
}
