// Importing the necessary libraries.
import 'package:flutter/material.dart';
import '../utils/app_fonts.dart';

// Creating a custom button widget.
class CustomButton extends StatelessWidget {
  // Constructor for the widget.
  const CustomButton({super.key, required this.onPressed, required this.text});

  // Declaring the variables that will be used in the widget.
  final void Function()?
      onPressed; // Function that will be called when the button is pressed.
  final String text; // Text that will be displayed on the button.

  // Building the widget.
  @override
  Widget build(BuildContext context) {
    // Returning a container that contains the button.
    return Container(
      // Adding padding to the container.
      padding: const EdgeInsets.all(24.0),

      // Setting the height of the container.
      height: MediaQuery.of(context).size.height * 0.13,

      // Setting the width of the container.
      width: MediaQuery.of(context).size.width,

      // Adding an ElevatedButton widget to the container.
      child: ElevatedButton(
        // Styling the ElevatedButton widget.
        style: ElevatedButton.styleFrom(
          // Setting the background color of the button.
          backgroundColor: const Color(0xff3366FF),

          // Setting the shape of the button.
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35),
          ),
        ),

        // Calling the onPressed function when the button is pressed.
        onPressed: onPressed,

        // Adding text to the button.
        child: Text(
          // Setting the text that will be displayed on the button.
          text,

          // Styling the text.
          style: const TextStyle(
            // Setting the color of the text.
            color: Colors.white,

            // Setting the font size of the text.
            fontSize: 16,

            // Setting the font family of the text.
            fontFamily: AppFonts.kRegisterButton,
          ),
        ),
      ),
    );
  }
}
