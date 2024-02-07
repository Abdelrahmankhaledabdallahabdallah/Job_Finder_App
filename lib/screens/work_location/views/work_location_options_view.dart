import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:job_finder_app/custom_widgets/custom_success_processes.dart';
import 'package:job_finder_app/screens/login/views/login_view.dart';

import '../../../custom_widgets/custom_button.dart';
import '../../../models/countries_model.dart';
import '../../../utils/app_fonts.dart';
import '../../../utils/app_images.dart';
import '../widgets/custom_selected_country_container.dart';

class WorkLocationOptionsView extends StatefulWidget {
  const WorkLocationOptionsView({super.key});
  static const String id = 'WorkLocationOptionsView';

  @override
  State<WorkLocationOptionsView> createState() =>
      _WorkLocationOptionsViewState();
}

class _WorkLocationOptionsViewState extends State<WorkLocationOptionsView> {
  List<bool> isSelected = [false, false];
  List<String> selectedCountries = [];
  String workPlace = '';
  List<String> work = ['Work From Office', 'Remote Work'];
  List<CountriesModel> country = [
    CountriesModel(
      flag: AppImages.kUSAflag,
      country: 'United States',
    ),
    CountriesModel(
      flag: AppImages.kMalaysiaFlag,
      country: 'Malaysia',
    ),
    CountriesModel(
      flag: AppImages.kSingaporeFlag,
      country: 'Singapore',
    ),
    CountriesModel(
      flag: AppImages.kIndonesiaFlag,
      country: 'Indonesia',
    ),
    CountriesModel(
      flag: AppImages.kPhiliphinesFlag,
      country: 'Philiphines',
    ),
    CountriesModel(
      flag: AppImages.kPolandiaFlag,
      country: 'Polandia',
    ),
    CountriesModel(
      flag: AppImages.kIndiaFlag,
      country: 'India',
    ),
    CountriesModel(
      flag: AppImages.kVietnamFlag,
      country: 'Vietnam',
    ),
    CountriesModel(
      flag: AppImages.kChinaFlag,
      country: 'China',
    ),
    CountriesModel(
      flag: AppImages.kCanadaFlag,
      country: 'Canada',
    ),
    CountriesModel(
      flag: AppImages.kSaudiArabiaFlag,
      country: 'Saudi Arabia',
    ),
    CountriesModel(
      flag: AppImages.kArgentinaFlag,
      country: 'Argentina',
    ),
    CountriesModel(
      flag: AppImages.kBrazilFlag,
      country: 'Brazil',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                'Where are you prefefred Location?',
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xff111827),
                  fontFamily: AppFonts.kOnBoardingHeadlineFont,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                'Let us know, where is the work location you want at this time, so we can adjust it.',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff737379),
                ),
              ),
              const SizedBox(height: 50),
              ToggleButtons(
                borderRadius: BorderRadius.circular(100),
                color: const Color(0xff6B7280),
                selectedColor: Colors.white,
                fillColor: const Color(0xff091A7A),
                isSelected: isSelected,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      work[0],
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      work[1],
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ],
                onPressed: (int newIndex) {
                  setState(() {
                    for (int index = 0; index < isSelected.length; index++) {
                      if (index == newIndex) {
                        isSelected[index] = true;
                        workPlace = work[index];
                      } else {
                        isSelected[index] = false;
                      }
                    }
                  });
                },
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    'Select the country you want for your job',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff737379),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  shrinkWrap: false,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 160,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 30,
                    mainAxisExtent: 40,
                  ),
                  itemCount: country.length,
                  itemBuilder: (context, index) {
                    final workplace = country[index].country;
                    final isSelected = selectedCountries.contains(workplace);
                    return CustomSelectedCountryContainer(
                      isClicked: isSelected,
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            selectedCountries.remove(workplace);
                          } else {
                            selectedCountries.add(workplace);
                            log(selectedCountries.toString());
                          }
                        });
                      },
                      country_name: country[index].country,
                      flag: country[index].flag,
                    );
                  },
                ),
              ),
              CustomButton(
                text: 'Next',
                onPressed: () {
                  // User? currentUser = FirebaseAuth.instance.currentUser;
                  // if (currentUser != null) {
                    // UserModel userModel =
                    //     UserModel(countries: selectedCountries);
                    // updateUser(currentUser, userModel, {
                    //   'countries': selectedCountries,
                    //   'workPlace': workPlace,
                    // });
                    // log('Data is updated');
                    // log(userModel.toJson().toString());
                  // }
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return CustomSuccessProcesses(
                        title: 'Your account has been set up!',
                        subtitle:
                            'We have customized feeds according to your preferences',
                        image: AppImages.kSuccessAccount,
                        buttonText: 'Get Started',
                        onPressed: () =>
                            Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const LoginView();
                          },
                        )),
                      );
                    },
                  ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
