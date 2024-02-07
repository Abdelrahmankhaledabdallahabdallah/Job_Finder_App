import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:job_finder_app/utils/app_fonts.dart';

import '../../../models/work_types_model.dart';
import '../../../utils/app_images.dart';
import '../../work_location/views/work_location_options_view.dart';
import '../widgets/custom_container_types.dart';

class TypeOfWorkSuggestionsView extends StatefulWidget {
  const TypeOfWorkSuggestionsView({super.key});
  static const String id = 'TypeOfWorkSuggestionsView';

  @override
  State<TypeOfWorkSuggestionsView> createState() =>
      _TypeOfWorkSuggestionsViewState();
}

class _TypeOfWorkSuggestionsViewState extends State<TypeOfWorkSuggestionsView> {
  List<String> selectedWorkTypes = [];

  List<WorkTypes> types = [
    WorkTypes(
      image: AppImages.kUiUxWork,
      text: 'UI/UX Designer',
    ),
    WorkTypes(
      image: AppImages.kUdWork,
      text: 'Ilustrator Designer',
    ),
    WorkTypes(
      image: AppImages.kDeveloper,
      text: 'Developer',
    ),
    WorkTypes(
      image: AppImages.kManagement,
      text: 'Management',
    ),
    WorkTypes(
      image: AppImages.kIT,
      text: 'Information Technology',
    ),
    WorkTypes(
      image: AppImages.kRA,
      text: 'Research and Analytics',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16, top: 16),
          child: Column(
            children: [
              const Text(
                'What type of work are you interested in?',
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xff111827),
                  fontFamily: AppFonts.kOnBoardingHeadlineFont,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Tell us what you’re interested in so we can customise the app for your needs.',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff737379),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.builder(
                  shrinkWrap: false,
                  itemCount: types.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 170,
                      mainAxisExtent: 145,
                      childAspectRatio: 2.24 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemBuilder: (context, index) {
                    final workType = types[index].text;
                    final isSelected = selectedWorkTypes.contains(workType);
                    return CustomContainerTypes(
                      isClicked: isSelected,
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            selectedWorkTypes.remove(workType);
                          } else {
                            selectedWorkTypes.add(workType);
                            log(selectedWorkTypes.toString());
                          }
                        });
                      },
                      icon: types[index].image,
                      work_type: types[index].text,
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                height: MediaQuery.of(context).size.height * 0.13,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff3366FF),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35)),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, WorkLocationOptionsView.id);
                  },
                  child: const Text(
                    "Next",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
