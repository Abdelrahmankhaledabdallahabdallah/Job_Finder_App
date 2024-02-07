import 'dart:developer'; // Import the 'developer' package to use 'log' for debugging
import 'dart:io'; // Import the 'dart:io' package for file handling
import 'package:bloc/bloc.dart'; // Import the 'bloc' package for state management
import 'package:dio/dio.dart'; // Import the 'dio' package for making HTTP requests
import 'package:job_finder_app/utils/shared_prefs.dart'; // Import the 'SharedPrefs' class from the 'utils' package
import 'package:meta/meta.dart'; // Import the 'meta' package for annotations
import '../../utils/constants.dart'; // Import the 'Constants' class from the 'utils' package
part 'cv_portfolio_state.dart'; // Import the 'CvPortfolioState' class

class CvPortfolioCubit extends Cubit<CvPortfolioState> {
  CvPortfolioCubit() : super(CvPortfolioInitial()); // Initialize the 'CvPortfolioCubit' with the initial state
  void uploadCvPortfolio({required File cvFile}) async {
    log('Loading..'); // Log a message to the console indicating that the upload process has started
    Dio dio = Dio(); // Create a new 'Dio' instance for making HTTP requests
    dio.options.headers['Authorization'] = 'Bearer ${SharedPrefs().token}'; // Set the authorization header for the HTTP request
    emit(CvPortfolioLoading()); // Emit the 'CvPortfolioLoading' state to indicate that the upload process is in progress
    FormData formData = FormData.fromMap({ // Create a 'FormData' object to hold the CV and image files
      'cv_file': await MultipartFile.fromFile(cvFile.path), // Add the CV file to the 'FormData'
      'image': await MultipartFile.fromFile(SharedPrefs().imgUrl), // Add the image file to the 'FormData'
    });
    try {
      final response = await dio.post( // Make a POST request to the server
        '$baseUrl/user/profile/portofolios', // Specify the endpoint URL
        data: formData, // Send the 'FormData' object as the request body
        options: Options( // Set the request options
          followRedirects: false, // Disable automatic redirection
        ),
      );
      if (response.statusCode == 200) { // Check if the response status code is 200 (OK)
        emit(CvPortfolioSuccess(cvFile)); // Emit the 'CvPortfolioSuccess' state to indicate that the upload was successful
      } else {
        // Handle the response or error here
        log('Request failed with status code: ${response.statusCode}'); // Log the response status code
        log('Response data: ${response.data}'); // Log the response data
        emit(CvPortfolioFailure(errMessage: 'Response data: ${response.data}')); // Emit the 'CvPortfolioFailure' state with an error message
      }
    } catch (e) {
      emit(CvPortfolioFailure(errMessage: 'Error: $e')); // Emit the 'CvPortfolioFailure' state with an error message
    }
  }
}
