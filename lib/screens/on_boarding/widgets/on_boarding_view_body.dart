import 'package:flutter/material.dart';
import 'package:job_finder_app/custom_widgets/custom_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../models/on_boarding_model.dart';
import '../../register/views/register_view.dart';
import 'custom_on_boarding_app_bar.dart';
import 'custom_on_boarding_headlines.dart';
import 'custom_on_boarding_subtitle.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({
    super.key,
    required this.index,
    required this.pageController,
  });

  final int index;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CustomOnBoardingAppBar(),
                Image.asset(content[index].image),
                CustomOnBoardingHeadlines(index: index),
                CustomOnBoardingSubtitle(index: index),
              ],
            ),
          ),
        ),
        SmoothIndicator(
          count: 3,
          offset: index.toDouble(),
          size: const Size(32, 25),
          effect: const ScaleEffect(
            dotHeight: 6,
            dotWidth: 6,
            spacing: 5,
            scale: 1.5,
            dotColor: Color(0xffADC8FF),
            activeDotColor: Color(0xff3366FF),
          ),
        ),
        CustomButton(
          onPressed: () {
            if (index == content.length - 1) {
              Navigator.pushNamed(context, RegisterView.id);
            }
            pageController.nextPage(
                duration: const Duration(milliseconds: 100),
                curve: Curves.bounceIn);
          },
          text: (index == content.length - 1 ? "Get Started" : "Next"),
        ),
      ],
    );
  }
}
