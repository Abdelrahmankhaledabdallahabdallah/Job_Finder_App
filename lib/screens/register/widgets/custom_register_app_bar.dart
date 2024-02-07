import 'package:flutter/material.dart';
import '../../../utils/app_images.dart';
import '../../on_boarding/views/on_boarding_view.dart';

class CustomRegisterAppBar extends StatelessWidget {
  const CustomRegisterAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Row(
        children: [
          GestureDetector(
              child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, OnBoardingView.id);
                  },
                  icon: const Icon(
                    Icons.arrow_back_outlined,
                  ))),
          const Spacer(),
          Image.asset(AppImages.kAppBarLogo),
        ],
      ),
    );
  }
}
