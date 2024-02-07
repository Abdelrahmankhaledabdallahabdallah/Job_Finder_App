import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_fonts.dart';

/// This widget represents an authentication option for the user to choose from.
class AuthAuthenticationOption extends StatelessWidget {
  /// Creates an instance of the widget.
  const AuthAuthenticationOption({
    super.key,
    required this.text,
    required this.action,
    required this.onPressed,
  });

  /// The text to display before the action.
  final String text;

  /// The action to display after the text.
  final String action;

  /// The callback to execute when the widget is tapped.
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    /// Returns a GestureDetector that, when tapped, calls the onPressed callback.
    /// The child of the GestureDetector is a RichText widget that displays the text
    /// and action in different styles.
    return GestureDetector(
      onTap: onPressed,
      child: RichText(
        text: TextSpan(
          /// The text to display before the action.
          text: text,
          style: const TextStyle(
            color: AppColors.kSuggestion,
            fontSize: 14,
            fontFamily: AppFonts.kSuggestionFont,
          ),
          children: [
            /// A space between the text and the action.
            const TextSpan(
              text: '  ',
            ),

            /// The action to display after the text.
            TextSpan(
              text: action,
              style: const TextStyle(
                color: AppColors.kSuggestionLogin,
                fontWeight: FontWeight.bold,
                fontFamily: AppFonts.kSuggestionFont,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
