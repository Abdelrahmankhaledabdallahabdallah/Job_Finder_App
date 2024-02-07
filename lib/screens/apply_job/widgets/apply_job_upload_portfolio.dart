// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:job_finder_app/custom_widgets/custom_button.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:job_finder_app/custom_widgets/custom_success_processes.dart';
import 'package:job_finder_app/screens/apply_job/widgets/upload_cv_view.dart';
import 'package:job_finder_app/screens/apply_job/widgets/upload_other_files_view.dart';
import 'package:job_finder_app/screens/home/views/home_view.dart';
import 'package:job_finder_app/services/job_api_service.dart';
import 'package:job_finder_app/utils/app_images.dart';
import 'package:provider/provider.dart';
import '../../../utils/app_fonts.dart';
import '../../home/widgets/home_view_body.dart';
import 'apply_form_headline.dart';
import 'applying_process.dart';

class ApplyJobUploadPortfolio extends StatefulWidget {
  const ApplyJobUploadPortfolio(
      {super.key,
      required this.name,
      required this.email,
      required this.phone,
      required this.selectedWorkType,
      required this.jobId});

  final String name;
  final String email;
  final String phone;
  final String selectedWorkType; // Store the selected work type
  final int jobId;

  @override
  State<ApplyJobUploadPortfolio> createState() =>
      _ApplyJobUploadPortfolioState();
}

class _ApplyJobUploadPortfolioState extends State<ApplyJobUploadPortfolio> {
  String? cvFileName;
  String? cvFileSize;
  String? cvFileFormat;
  String? otherFileName;
  String? otherFileSize;
  String? otherFileFormat;
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ApplyingProcess(
                  currentStep: 3,
                ),
                const SizedBox(height: 25),
                const ApplyFormHeadline(
                    headline: 'Upload portfolio',
                    subheadline: 'Fill in your bio data correctly'),
                UploadCvView(
                  onTap: () => pickCvFile(),
                  fileName: cvFileName,
                  fileSize: cvFileSize,
                  removeFile: removeCvFile,
                ),
                const SizedBox(height: 20),
                UploadOtherFilesView(
                  onTap: () => pickOtherFile(),
                  fileName: otherFileName,
                  fileSize: otherFileSize,
                ),
                CustomButton(
                  onPressed: () {
                    JobApiService.applyJob(
                      cvFile: cvFile,
                      email: widget.email,
                      name: widget.name,
                      otherFile: otherFile,
                      phone: widget.phone,
                      selectedWorkType: widget.selectedWorkType,
                      jobId: widget.jobId,
                    );
                    Provider.of<ApplicationState>(context, listen: false)
                        .setDataSubmitted(true);

                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return CustomSuccessProcesses(
                          title: 'Your data has been successfully sent',
                          subtitle:
                              'You will get a message from our team, about the announcement of employee acceptance',
                          image: AppImages.kDataIlustration,
                          buttonText: 'Back to home',
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return HomeView();
                              },
                            ),
                          ),
                        );
                      },
                    ));
                  },
                  text: 'Submit',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  File? otherFile;
  File? cvFile;
  void removeCvFile() {
    setState(() {
      cvFileName = null;
      cvFileSize = null;
      cvFile = null;
    });
  }

  Future pickCvFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      cvFile = File(result.files.single.path ?? "");
      setState(() {
        cvFileName = cvFile?.path.split('/').last; // Extract the filename
        cvFileSize =
            '${(cvFile?.lengthSync() ?? 0) / 1024} KB'; // Calculate the file size in KB
      });
    }
  }

  Future pickOtherFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      otherFile = File(result.files.single.path ?? "");
      setState(() {
        otherFileName = otherFile?.path.split('/').last; // Extract the filename
        otherFileSize =
            '${(otherFile?.lengthSync() ?? 0) / 1024} KB'; // Calculate the file size in KB
      });
    }
  }
}
