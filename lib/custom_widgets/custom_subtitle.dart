// Import the required libraries.
import 'package:flutter/cupertino.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_fonts.dart';

// Create a custom text widget for the subtitle.
class CustomSubtitle extends StatelessWidget {
  // Initialize the subtitle property.
  const CustomSubtitle({
    super.key,
    required this.subtitle,
  });

  final String subtitle;

  @override
  Widget build(BuildContext context) {
    // Add padding to the subtitle.
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(
        // Set the subtitle text.
        subtitle,
        // Set the style of the subtitle.
        style: const TextStyle(
          fontSize: 16,
          fontFamily: AppFonts.kRegisterSubHeadlineFont,
          color: AppColors.kRegisterSubHeadlines,
        ),
      ),
    );
  }
}
