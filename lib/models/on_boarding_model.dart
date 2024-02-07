// This is an import statement that imports the 'dart:ui' library.
// The 'dart:ui' library contains classes and functions that are used to create and manipulate user interfaces.
import 'dart:ui';

// This is an import statement that imports the 'app_colors.dart' library.
// The 'app_colors.dart' library contains a set of colors that are used in the app.
import '../utils/app_colors.dart';

// This is an import statement that imports the 'app_images.dart' library.
// The 'app_images.dart' library contains a set of images that are used in the app.
import '../utils/app_images.dart';

// This is a class called 'OnBoardingModel'.
// It contains the properties of an onboarding screen.
class OnBoardingModel {
  // This is a property called 'image'.
  // It is a string that contains the path to the image that is displayed on the onboarding screen.
  String image;

  // This is a property called 'headline1'.
  // It is a string that contains the first headline that is displayed on the onboarding screen.
  String headline1;

  // This is a property called 'headline2'.
  // It is a string that contains the second headline that is displayed on the onboarding screen.
  String headline2;

  // This is a property called 'headline3'.
  // It is a string that contains the third headline that is displayed on the onboarding screen.
  String headline3;

  // This is a property called 'headline1Color'.
  // It is a color that is used to display the first headline.
  Color headline1Color;

  // This is a property called 'headline2Color'.
  // It is a color that is used to display the second headline.
  Color headline2Color;

  // This is a property called 'headline3Color'.
  // It is a color that is used to display the third headline.
  Color headline3Color;

  // This is a property called 'subtitle'.
  // It is a string that contains the subtitle that is displayed on the onboarding screen.
  String subtitle;

  // This is a constructor for the 'OnBoardingModel' class.
  // It takes the following parameters:
  // - 'image': The path to the image that is displayed on the onboarding screen.
  // - 'headline1': The first headline that is displayed on the onboarding screen.
  // - 'headline2': The second headline that is displayed on the onboarding screen.
  // - 'headline3': The third headline that is displayed on the onboarding screen.
  // - 'headline1Color': The color that is used to display the first headline.
  // - 'headline2Color': The color that is used to display the second headline.
  // - 'headline3Color': The color that is used to display the third headline.
  // - 'subtitle': The subtitle that is displayed on the onboarding screen.
  OnBoardingModel({
    required this.image,
    required this.headline1,
    required this.headline2,
    required this.headline3,
    required this.headline1Color,
    required this.headline2Color,
    required this.headline3Color,
    required this.subtitle,
  });
}

// This is a list of 'OnBoardingModel' objects.
// Each object represents an onboarding screen.
List<OnBoardingModel> content = <OnBoardingModel>[
  // This is the first onboarding screen.
  OnBoardingModel(
      image: AppImages.kOnBoarding1,
      headline1: 'Find a job, and ',
      headline2: 'start building',
      headline3: ' your career from now on',
      headline1Color: AppColors.kOnBoardingHeadline1,
      headline2Color: AppColors.kOnBoardingHeadline2,
      headline3Color: AppColors.kOnBoardingHeadline1,
      subtitle:
          'Explore over 25,924 available job roles and upgrade your operator now.'),

  // This is the second onboarding screen.
  OnBoardingModel(
      image: AppImages.kOnBoarding2,
      headline1: 'Hundreds of jobs ',
      headline2: 'are waiting for you to',
      headline3: ' join together',
      headline1Color: AppColors.kOnBoardingHeadline1,
      headline2Color: AppColors.kOnBoardingHeadline1,
      headline3Color: AppColors.kOnBoardingHeadline2,
      subtitle:
          'Immediately join us and start applying for the job you are interested in.'),

  // This is the third onboarding screen.
  OnBoardingModel(
      image: AppImages.kOnBoarding3,
      headline1: 'Get the best ',
      headline2: 'choice for the job ',
      headline3: ' you\'ve always dreamed of',
      headline1Color: AppColors.kOnBoardingHeadline1,
      headline2Color: AppColors.kOnBoardingHeadline2,
      headline3Color: AppColors.kOnBoardingHeadline1,
      subtitle:
          'The better the skills you have, the greater the good job opportunities for you.'),
];
