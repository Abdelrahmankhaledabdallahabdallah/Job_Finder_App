import 'package:flutter/material.dart';

import '../../../utils/app_fonts.dart';
import '../../../utils/app_images.dart';
import '../../job_details/widgets/job_detail.dart';
import 'applied_job_view_future_builder.dart';

class AppliedViewBody extends StatefulWidget {
  const AppliedViewBody({super.key});

  @override
  State<AppliedViewBody> createState() => _AppliedViewBodyState();
}

class _AppliedViewBodyState extends State<AppliedViewBody> {
  List<String> labels = ['Activate', 'Rejected'];

  ScrollController jobDetailScrollController = ScrollController();

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: JobDetail(
            minWidth: 180.0,
            counter: counter,
            labels: labels,
            onToggle: (index) {
              setState(
                () {
                  counter = index!;
                },
              );
            },
          ),
        ),
        SliverToBoxAdapter(
          child: counter == 0
              ? const AppliedJobViewFutureBuilder()
              : const CustomRejectedAppliedJob(),
        ),
      ],
    );
  }
}

class CustomRejectedAppliedJob extends StatelessWidget {
  const CustomRejectedAppliedJob({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.kNoDataIlustration),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'No applications were rejected',
              style: TextStyle(
                fontSize: 24,
                fontFamily: AppFonts.kRegisterHeadlineFont,
                color: Color(0xff111827),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 16,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'If there is an application that is rejected by the company it will appear here',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff6B7280),
                  fontFamily: AppFonts.kRegisterHintFont,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
