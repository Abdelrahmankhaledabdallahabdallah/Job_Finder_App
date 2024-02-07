import 'package:flutter/material.dart';
import '../../../custom_widgets/custom_button.dart'; //import the custom button widget
import '../../../utils/app_fonts.dart'; //import the app fonts file

//class to define the custom success process screen
class CustomSuccessProcesses extends StatelessWidget {
  //constructor to initialize the title, subtitle, image, button text and on pressed function
  const CustomSuccessProcesses(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.image,
      required this.buttonText,
      this.onPressed});

  //define the title of the screen
  final String title;

  //define the subtitle of the screen
  final String subtitle;

  //define the image path of the screen
  final String image;

  //define the button text of the screen
  final String buttonText;

  //define the on pressed function of the button
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0), //padding of the screen
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //align the column to the center
          children: [
            Image.asset(image), //display the image
            const SizedBox(
              height: 20, //add a space between the image and the title
            ),
            Text(
              title, //display the title
              style: const TextStyle(
                fontSize: 24, //set the font size to 24
                fontFamily: AppFonts.kRegisterHeadlineFont, //set the font family to the register headline font
                color: Color(0xff111827), //set the color to a dark grey
              ),
              textAlign: TextAlign.center, //align the text to the center
            ),
            const SizedBox(
              height: 16, //add a space between the title and the subtitle
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16), //padding of the subtitle
              child: Text(
                subtitle, //display the subtitle
                style: const TextStyle(
                  fontSize: 14, //set the font size to 14
                  color: Color(0xff6B7280), //set the color to a light grey
                  fontFamily: AppFonts.kRegisterHintFont, //set the font family to the register hint font
                ),
                textAlign: TextAlign.center, //align the text to the center
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0), //padding of the button
        child: CustomButton( //display the custom button
          text: buttonText, //set the button text
          onPressed: onPressed, //set the on pressed function
        ),
      ),
    );
  }
}
