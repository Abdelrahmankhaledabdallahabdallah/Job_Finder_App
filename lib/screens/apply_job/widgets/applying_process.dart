
// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:job_finder_app/screens/apply_job/widgets/stap_circle.dart';

import 'custom_dots.dart';

class ApplyingProcess extends StatelessWidget {
  ApplyingProcess({
    super.key,
    required this.currentStep,
  });

  final int currentStep;
  int totalSteps = 3;

  List<String> text = ['Biodata', 'Type of work', 'Upload portfolio'];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalSteps,
        (index) {
          return Row(
            children: [
              StepCircle(
                isDone: index < currentStep - 1,
                number: index + 1,
                isActive: index + 1 == currentStep,
                text: text[index],
              ),
              if (index != totalSteps - 1)
                CustomDots(
                  isActive: index + 1 == currentStep,
                ),
            ],
          );
        },
      ),
    );
  }
}
