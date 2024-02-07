import 'package:flutter/material.dart';

import '../../../utils/app_fonts.dart';
import '../../../utils/app_images.dart';
import 'filter_item.dart';

class CustomFilter extends StatelessWidget {
  const CustomFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          context: context,
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.only(
                  right: 25, left: 25, top: 10, bottom: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 48,
                        height: 3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Message filters',
                      style: TextStyle(
                        color: Color(
                          0xff111827,
                        ),
                        fontSize: 18,
                        fontFamily: AppFonts.kLoginHeadlineFont,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const FilterItem(),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: CircleAvatar(
        radius: 30,
        backgroundColor: const Color(0xffD1D5DB),
        child: CircleAvatar(
          radius: 29,
          backgroundColor: Colors.white,
          child: Image.asset(AppImages.kFilter),
        ),
      ),
    );
  }
}
