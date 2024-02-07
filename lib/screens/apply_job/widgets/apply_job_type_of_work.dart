// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:job_finder_app/models/apply_job_model.dart';
import 'package:job_finder_app/screens/apply_job/widgets/type_of_work_choices.dart';

import '../../../custom_widgets/custom_button.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_fonts.dart';
import 'apply_job_upload_portfolio.dart';
import 'applying_process.dart';

class ApplyJobTypeOfWork extends StatefulWidget {
  const ApplyJobTypeOfWork(
      {super.key,
      required this.name,
      required this.email,
      required this.phone,
      required this.jobId});

  final String name;
  final String email;
  final String phone;
  final int jobId;

  @override
  State<ApplyJobTypeOfWork> createState() => ApplyJobTypeOfWorkState();
}

class ApplyJobTypeOfWorkState extends State<ApplyJobTypeOfWork> {
  ApplyJobsModel applyJobs = ApplyJobsModel();
  String selectedWorkType = ''; // Store the selected work type
  void handleWorkTypeSelected(String workType) {
    setState(() {
      selectedWorkType = workType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Apply Job',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: AppFonts.kLoginHeadlineFont,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               ApplyingProcess(
                // stepCompletionStatus: [true, false, false],
                currentStep: 2,
                // totalSteps: 3,
              ),
              const SizedBox(height: 25),
              const Padding(
                padding: EdgeInsets.only(top: 8, bottom: 5),
                child: Text(
                  'Type of work',
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColors.kLoginHeadlines,
                    fontFamily: AppFonts.kLoginHeadlineFont,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Text(
                  'Fill in your bio data correctly',
                  style: TextStyle(
                    color: Color(0xff6B7280),
                    fontSize: 14,
                    fontFamily: AppFonts.kLoginSubHeadlineFont,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TypeOfWorkChoices(onWorkTypeSelected: handleWorkTypeSelected),
              CustomButton(
                  onPressed: () {
                    if (selectedWorkType.isNotEmpty) {
                      try {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return ApplyJobUploadPortfolio(
                              email: widget.email,
                              name: widget.name,
                              phone: widget.phone,
                              jobId: widget.jobId,
                              selectedWorkType: selectedWorkType,
                            );
                          },
                        ));
                      } catch (error) {
                        print('API request failed: $error');
                      }
                    }
                  },
                  text: 'Next'),
            ],
          ),
        ),
      ),
    );
  }
}
