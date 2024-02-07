import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class CustomDots extends StatelessWidget {
  const CustomDots({
    super.key,
    required this.isActive,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: DottedLine(
        direction: Axis.horizontal,
        alignment: WrapAlignment.center,
        lineLength: MediaQuery.of(context).size.width * 0.08,
        lineThickness: 1.0,
        dashLength: 4.0,
        dashColor: isActive ? const Color(0xff3366FF) : const Color(0xff9CA3AF),
        dashGapLength: 4.0,
        dashGapColor: Colors.white,
      ),
    );
  }
}
