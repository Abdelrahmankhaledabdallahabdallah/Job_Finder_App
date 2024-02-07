import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_finder_app/utils/app_images.dart';

import '../../../cubits/cv_portfolio_cubit/cv_portfolio_cubit.dart';
import '../../../utils/app_fonts.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';

import 'custom_cv_portfolio.dart';

class PortfolioView extends StatefulWidget {
  const PortfolioView({super.key});

  @override
  State<PortfolioView> createState() => _PortfolioViewState();
}

class _PortfolioViewState extends State<PortfolioView> {
  String? cvFileName;
  String? cvFileSize;
  String? cvFileFormat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Portfolio',
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
        child: BlocConsumer<CvPortfolioCubit, CvPortfolioState>(
          listener: (context, state) {
            if (state is CvPortfolioSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('File added successfully!'),
                ),
              );
            } else if (state is CvPortfolioFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errMessage),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is CvPortfolioLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Add portfolio here',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff111827),
                    fontFamily: AppFonts.kLoginHeadlineFont,
                  ),
                ),
                const SizedBox(height: 20),
                CustomCvPortfolio(
                  onTap: () => pickCvFile(),
                ),
                const SizedBox(height: 20),
                if (cvFileName != null)
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xffD1D5DB),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Image.asset(AppImages.kPDF),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cvFileName.toString(),
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff111827),
                                  fontFamily: AppFonts.kLoginHeadlineFont,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                cvFileSize.toString(),
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff6B7280),
                                  fontFamily: AppFonts.kLoginSubHeadlineFont,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Image.asset(AppImages.kEdit),
                          const SizedBox(width: 10),
                          GestureDetector(
                              onTap: () => removeCvFile(),
                              child: Image.asset(AppImages.kCloseCircle))
                        ],
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

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
      // ignore: use_build_context_synchronously
      context.read<CvPortfolioCubit>().uploadCvPortfolio(cvFile: cvFile!);
      setState(() {
        cvFileName = cvFile?.path.split('/').last; // Extract the filename
        cvFileSize =
            '${(cvFile?.lengthSync() ?? 0) / 1024} KB'; // Calculate the file size in KB
      });
    }
  }
}
