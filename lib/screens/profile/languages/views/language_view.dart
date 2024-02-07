import 'package:flutter/material.dart';
import 'package:job_finder_app/screens/apply_job/widgets/custom_radio_button.dart';
import 'package:job_finder_app/utils/app_images.dart';

import '../../../../utils/app_fonts.dart';

class LanguageView extends StatefulWidget {
  const LanguageView({super.key});

  @override
  State<LanguageView> createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
  List<String> language = [
    'English',
    'Indonesia',
    'Arabic',
    'Chinese',
    'Dutch',
    'French',
    'German',
    'Japanese',
    'Korean',
    'Portuguese',
  ];

  List<String> flag = [
    AppImages.kEngland,
    AppImages.kIndonesia,
    AppImages.kSaudiArabia,
    AppImages.kChina,
    AppImages.kNetherlands,
    AppImages.kFrance,
    AppImages.kGermany,
    AppImages.kJapan,
    AppImages.kSouthKorea,
    AppImages.kPortugal,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Language',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              child: ListView.separated(
                itemCount: language.length,
                shrinkWrap: true, // Set shrinkWrap to true
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                    trailing: const CustomRadioButton(isSelected: false),
                    leading: Image.asset(flag[index]),
                    title: Text(
                      language[index],
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xff111827),
                        fontFamily: AppFonts.kLoginSubHeadlineFont,
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Divider(
                      thickness: 1,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
