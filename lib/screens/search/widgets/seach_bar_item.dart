import 'package:flutter/material.dart';
import 'package:job_finder_app/models/jobs_model.dart';

import '../../../utils/app_fonts.dart';
import '../../../utils/app_images.dart';

class SearchBarItem extends StatelessWidget {
  const SearchBarItem({
    super.key,
    required this.job,
  });
  final JobsModel job;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            right: 20.0,
            left: 20.0,
            bottom: 8.0,
            top: 8,
          ),
          child: Row(
            children: [
              ColorFiltered(
                colorFilter: const ColorFilter.mode(
                  Colors.black,
                  BlendMode.modulate,
                ),
                child: Image.asset(AppImages.kClock),
              ),
              const SizedBox(width: 15),
              Text(
                job.name??"",
                style: const TextStyle(
                  color: Color(0xff111827),
                  fontSize: 14,
                  fontFamily: AppFonts.kLoginSubHeadlineFont,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  // setState(() {
                  //   display_list.removeAt(index);
                  // });
                },
                child: Image.asset(
                  AppImages.kCloseCircle,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
