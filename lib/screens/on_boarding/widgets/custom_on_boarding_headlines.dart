import 'package:flutter/cupertino.dart';
import 'package:job_finder_app/models/on_boarding_model.dart';
import '../../../utils/app_fonts.dart';

class CustomOnBoardingHeadlines extends StatelessWidget {
  const CustomOnBoardingHeadlines({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 16),
      child: RichText(
        text: TextSpan(
          text: content[index].headline1,
          style: TextStyle(
              fontSize: 32,
              fontFamily: AppFonts.kOnBoardingHeadlineFont,
              color: content[index].headline1Color),
          children: <TextSpan>[
            TextSpan(
                text: content[index].headline2,
                style: TextStyle(color: content[index].headline2Color)),
            TextSpan(
                text: content[index].headline3,
                style: TextStyle(color: content[index].headline3Color))
          ],
        ),
      ),
    );
  }
}
