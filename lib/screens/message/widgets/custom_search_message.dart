import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import 'custom_filter.dart';

class CustomSearchMessage extends StatelessWidget {
  const CustomSearchMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.75,
          child: Expanded(
            child: TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                prefixIcon: Image.asset(AppImages.kSearch),
                hintText: 'Search message...',
                hintStyle: const TextStyle(
                  fontSize: 14,
                  color: AppColors.kRegisterHints,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: const BorderSide(
                    color: Color(0xffD1D5DB),
                  ),
                ),
              ),
            ),
          ),
        ),
        const CustomFilter(),
      ],
    );
  }
}
