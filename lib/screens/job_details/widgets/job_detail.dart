import 'package:flutter/material.dart';
import 'package:job_finder_app/utils/app_fonts.dart';
import 'package:toggle_switch/toggle_switch.dart';

class JobDetail extends StatefulWidget {
  @override
  State<JobDetail> createState() => _JobDetailState();
  const JobDetail(
      {super.key, required this.counter, required this.labels, this.onToggle, required this.minWidth});

  final int counter;
  final List<String> labels;
  final Function(int?)? onToggle;
  final double minWidth;
}

class _JobDetailState extends State<JobDetail> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Center(
        child: ToggleSwitch(
            minWidth: widget.minWidth,
            cornerRadius: 20.0,
            activeFgColor: Colors.white,
            activeBgColor: const [Color(0xff02337A)],
            inactiveBgColor: const Color(0xffF4F4F5),
            inactiveFgColor: const Color(0xff6B7280),
            initialLabelIndex: widget.counter,
            totalSwitches: widget.labels.length,
            labels: widget.labels,
            fontSize: 14,
            customTextStyles: const [
              TextStyle(fontFamily: AppFonts.kLoginHeadlineFont)
            ],
            radiusStyle: true,
            onToggle: widget.onToggle),
      ),
    );
  }
}
