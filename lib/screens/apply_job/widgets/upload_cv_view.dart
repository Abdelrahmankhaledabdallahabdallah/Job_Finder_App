import 'package:flutter/material.dart';

import '../../../utils/app_images.dart';
import 'apply_form_title.dart';
class UploadCvView extends StatelessWidget {
  const UploadCvView({
    super.key,
    this.onTap,
    this.removeFile,
    this.fileName,
    this.fileSize,
  });

  final Function()? onTap;
  final Function()? removeFile;
  final String? fileName;
  final String? fileSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ApplyFormTitle(title: 'Upload CV'),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 24,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: const Color(0xffD1D5DB),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: onTap,
                child: Center(
                  child: Image.asset(
                    fileName != null ? AppImages.kPDF : AppImages.kExport,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(fileName ?? 'Upload your CV'),
                  const SizedBox(height: 10),
                  Text('CV.pdf $fileSize'),
                ],
              ),
              const Spacer(),
              GestureDetector(
                onTap: onTap,
                child: Image.asset(AppImages.kEdit),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: removeFile,
                child: Image.asset(AppImages.kCloseCircle),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
