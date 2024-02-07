import 'package:flutter/material.dart';
import '../widgets/on_boarding_view_body_page_view.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  static const String id = 'on_boarding_view';

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: OnBoardingViewBodyPageView(),
      ),
    );
  }
}
