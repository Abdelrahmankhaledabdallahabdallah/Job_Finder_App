// Import the necessary libraries.
import 'package:flutter/cupertino.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_fonts.dart';

// Define the CustomTitle widget.
class CustomTitle extends StatelessWidget {
  // Initialize the title property.
  const CustomTitle({
    super.key,
    required this.title,
  });

  // Define the title property.
  final String title;

  // Override the build method.
  @override
  Widget build(BuildContext context) {
    // Return a Padding widget.
    return Padding(
      // Set the top padding to 16.
      padding: const EdgeInsets.only(top: 16),
      // Return a Text widget.
      child: Text(
        // Set the title text.
        title,
        // Set the text style.
        style: const TextStyle(
            // Set the font size to 28.
            fontSize: 28,
            // Set the font family to AppFonts.kRegisterHeadlineFont.
            fontFamily: AppFonts.kRegisterHeadlineFont,
            // Set the text color to AppColors.kRegisterHeadlines.
            color: AppColors.kRegisterHeadlines),
      ),
    );
  }
}
