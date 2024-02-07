import 'package:bloc/bloc.dart'; //import the bloc library
import 'package:job_finder_app/services/user_profile_api_service.dart'; //import the user_profile_api_service.dart file
import 'package:meta/meta.dart'; //import the meta library

//import the user_portofolio_model.dart file
import '../../models/user_portofolio_model.dart';

//import the profile_state.dart file
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {// ProfileCubit class extends Cubit and uses ProfileState as the state type
  //ProfileCubit constructor
  ProfileCubit() : super(ProfileInitial()); //initial state is ProfileInitial

  //method to fetch profile data
  Future<void> fetchProfileData() async {
    try {
      //emit ProfileLoading state
      emit(ProfileLoading());

      //fetch user portfolio model from UserProfileApiService
      UserPortofolioModel? userPortofolioModel = await UserProfileApiService.fetchUserPortofolio();

      if (userPortofolioModel != null) {
        //emit ProfileSuccess state with userPortofolioModel
        emit(ProfileSuccess(userPortofolio: userPortofolioModel));
      } else {
        //emit ProfileNoData state
        emit(ProfileNoData());
      }
    } catch (e) {
      //emit ProfileFailure state with error message
      emit(ProfileFailure(errMessage: 'An error occurred: $e'));
    }
  }
}
