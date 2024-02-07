import 'package:flutter/material.dart';
import 'package:job_finder_app/models/on_boarding_model.dart';
import 'package:job_finder_app/screens/on_boarding/widgets/on_boarding_view_body.dart';

class OnBoardingViewBodyPageView extends StatefulWidget {
  const OnBoardingViewBodyPageView({super.key});

  @override
  State<OnBoardingViewBodyPageView> createState() =>
      _OnBoardingViewBodyPageViewState();
}

class _OnBoardingViewBodyPageViewState
    extends State<OnBoardingViewBodyPageView> {
  double currentIndex = 0;
  PageController? pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      onPageChanged: (int index) {
        setState(() {
          currentIndex = index.ceilToDouble();
        });
      },
      itemCount: content.length,
      itemBuilder: (context, index) {
        return OnBoardingViewBody(
          index: index,
          pageController: pageController!,
        );
      },
    );
  }
}
