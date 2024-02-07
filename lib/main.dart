// Import the necessary libraries
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_finder_app/screens/home/views/home_view.dart';
import 'package:job_finder_app/screens/home/widgets/home_view_body.dart';
import 'package:job_finder_app/screens/login/views/login_view.dart';
import 'package:job_finder_app/screens/register/views/register_view.dart';
import 'package:job_finder_app/screens/work_location/views/work_location_options_view.dart';
import 'package:job_finder_app/screens/work_suggestions/views/type_of_work_suggestions_view.dart';
import 'package:job_finder_app/utils/app_colors.dart';
import 'package:job_finder_app/utils/shared_prefs.dart';
import 'package:provider/provider.dart';
import 'cubits/profile_cubit/profile_cubit.dart';
import 'screens/on_boarding/views/on_boarding_view.dart';
import 'screens/splash/views/splash_view.dart';

void main() async {
  // Ensure that the WidgetsFlutterBinding is initialized before running the app
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the shared preferences
  await SharedPrefs().init();

  // Run the app
  runApp(const JobFinderApp());
}

// Define the JobFinderApp widget
class JobFinderApp extends StatelessWidget {
  const JobFinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Use MultiProvider to provide the ApplicationState and ProfileCubit to the app
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ApplicationState()),
        BlocProvider(create: (context) => ProfileCubit()),
      ],
      child: MaterialApp(
        // Set the title of the app
        title: 'Job Finder',

        // Define the theme of the app
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.kPrimaryColor,
        ),

        // Disable the debug banner
        debugShowCheckedModeBanner: false,

        // Define the routes for the app
        routes: {
          SplashView.id: (context) => const SplashView(),
          OnBoardingView.id: (context) => const OnBoardingView(),
          RegisterView.id: (context) => const RegisterView(),
          LoginView.id: (context) => const LoginView(),
          TypeOfWorkSuggestionsView.id: (context) =>
              const TypeOfWorkSuggestionsView(),
          HomeView.id: (context) => const HomeView(),
          WorkLocationOptionsView.id: (context) =>
              const WorkLocationOptionsView(),
        },

        // Set the initial route of the app
        initialRoute: SplashView.id,
      ),
    );
  }
}
