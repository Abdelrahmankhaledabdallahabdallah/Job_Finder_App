// Import the necessary libraries
import 'package:flutter/material.dart';
import 'package:job_finder_app/utils/app_colors.dart';
import 'package:job_finder_app/utils/app_fonts.dart';

// Create a stateless widget called BuildDivier to display a divider with text
class BuildDivier extends StatelessWidget {
  // Define a const constructor for the BuildDivier widget with a required text parameter
  const BuildDivier({super.key, required this.text});

  // Define the text parameter
  final String text;

  @override
  // The build method of the BuildDivier widget returns a Row widget with a divider, text, and another divider
  Widget build(BuildContext context) {
    return Row(
      // Set the crossAxisAlignment to CrossAxisAlignment.start to align the text vertically
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Add an expanded widget to create a divider that spans the entire width of the row
        const Expanded(
          child: Divider(
            // Set the color of the divider to AppColors.kDividerColor
            color: AppColors.kDividerColor,
            // Set the thickness of the divider to 1
            thickness: 1,
          ),
        ),
        // Add a padding widget to add some space around the text
        Padding(
          // Set the padding to 25 pixels horizontally
          padding: const EdgeInsets.symmetric(horizontal: 25),
          // Add a Text widget to display the specified text
          child: Text(
            // Set the text to the text parameter
            text,
            // Set the text style to a TextStyle with a font size of 14, color of AppColors.kRegisterSubHeadlines, and fontFamily of AppFonts.kRegisterHintFont
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.kRegisterSubHeadlines,
              fontFamily: AppFonts.kRegisterHintFont,
            ),
          ),
        ),
        // Add another expanded widget to create a divider that spans the entire width of the row
        const Expanded(
          child: Divider(
            // Set the color of the divider to AppColors.kDividerColor
            color: AppColors.kDividerColor,
            // Set the thickness of the divider to 1
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
