import 'package:flutter/material.dart';
import 'package:job_finder_app/custom_widgets/custom_dotted_upload_files.dart';
import '../../../utils/app_fonts.dart';

class UploadOtherFilesView extends StatelessWidget {
  const UploadOtherFilesView(
      {super.key, this.onTap, this.removeFile, this.fileName, this.fileSize});

  final Function()? onTap;
  final Function()? removeFile;
  final String? fileName;
  final String? fileSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Other File',
          style: TextStyle(
              color: Color(0xff111827),
              fontSize: 16,
              fontFamily: AppFonts.kLoginSubHeadlineFont),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: CustomDottedUploadFiles(
            fileName: fileName,
            onTap: onTap,
            fileSize: fileSize,
          ),
        )
      ],
    );
  }
}
