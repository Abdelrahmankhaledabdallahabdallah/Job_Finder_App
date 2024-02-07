import 'package:flutter/material.dart';
import 'package:job_finder_app/screens/apply_job/widgets/apply_job_form.dart';

class ApplyJobBiodata extends StatefulWidget {
  const ApplyJobBiodata({
    super.key,
    required this.jobId,
  });
  final int jobId;

  @override
  State<ApplyJobBiodata> createState() => _ApplyJobBiodataState();
}

class _ApplyJobBiodataState extends State<ApplyJobBiodata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ApplyJobForm(
          jobId: widget.jobId,
        ),
      ),
    );
  }
}
