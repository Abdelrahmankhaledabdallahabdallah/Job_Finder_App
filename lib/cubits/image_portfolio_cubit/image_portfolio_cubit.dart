import 'dart:developer'; //import the developer package to log messages in the console

import 'package:bloc/bloc.dart'; //import the bloc package to manage the state of the widget
import 'package:image_picker/image_picker.dart'; //import the image_picker package to pick images from the device
import 'package:meta/meta.dart'; //import the meta package to annotate parameters and return values

import '../../screens/profile/edit_profile/widgets/image_service.dart'; //import the ImageService class to upload images to the server
import '../../utils/shared_prefs.dart'; //import the SharedPrefs class to store the image url in shared preferences

part 'image_portfolio_state.dart';

class ImagePortfolioCubit extends Cubit<ImagePortfolioState> {
  ImagePortfolioCubit()
      : super(ImagePortfolioInitial()); //initial state of the cubit

  void uploadImage(ImageSource imageSource) async {
    //method to upload an image
    try {
      emit(ImagePortfolioLoading()); //emit the loading state

      final pickedFile = await ImagePicker()
          .pickImage(source: imageSource); //pick an image from the device
      log("Uploading file: ${pickedFile.toString()}"); //log the file path

      if (pickedFile != null) {
        //if an image was picked
        var response = await ImageService.uploadFile(
            pickedFile.path); //upload the image to the server
        log("* Uploading file: ${pickedFile.path}"); //log the file path
        log("* Response: ${response.statusCode}"); //log the response status code

        if (response.statusCode == 200) {
          //if the response status code is 200 (OK)
          log("Uploading file: ${pickedFile.path}"); //log the file path

          //get image url from api response
          final imageUrl = response.data['data']
              ['image']; //extract the image url from the response
          SharedPrefs().imgUrl =
              pickedFile.path; //store the image url in shared preferences

          log("Response: $response"); //log the response
          log('image: $imageUrl'); //log the image url

          log('Image uploaded successfully'); //log a success message
          emit(ImagePortfolioSuccess(
              imageUrl)); //emit the success state with the image url
        } else {
          //if the response status code is not 200
          emit(ImagePortfolioFailure(
              //emit the failure state
              errMessage:
                  'Error Code: ${response.statusCode}')); //with the error message containing the response status code
        }
      } else {
        //if no image was picked
        emit(ImagePortfolioFailure(
            //emit the failure state
            errMessage: 'Error')); //with the error message 'Error'
      }
    } catch (e) {
      //if an error occurs
      emit(ImagePortfolioFailure(
          //emit the failure state
          errMessage:
              'Error: $e')); //with the error message containing the error
    }
  }
}
