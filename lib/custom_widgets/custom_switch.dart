// Import the necessary libraries.
import 'package:flutter/material.dart';

// Define a custom switch widget.
class CustomSwitch extends StatefulWidget {
  // The constructor for the CustomSwitch widget.
  const CustomSwitch({super.key});

  // Create the state for the CustomSwitch widget.
  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

// Define the state for the CustomSwitch widget.
class _CustomSwitchState extends State<CustomSwitch> {
  // Initialize the toggleValue variable.
  bool toggleValue = false;

  // Build the CustomSwitch widget.
  @override
  Widget build(BuildContext context) {
    // Create an AnimatedContainer to animate the switch.
    return AnimatedContainer(
      // Set the duration of the animation.
      duration: const Duration(milliseconds: 2),

      // Set the height and width of the switch.
      height: 26,
      width: 48,

      // Set the decoration of the switch.
      decoration: BoxDecoration(
        // Set the border radius of the switch.
        borderRadius: BorderRadius.circular(20),

        // Set the color of the switch.
        color: toggleValue ? const Color(0xff3366FF) : const Color(0xffD1D5DB),
      ),

      // Create a Stack to position the elements of the switch.
      child: Stack(
        // Add the children to the Stack.
        children: [
          // Create an AnimatedPositioned to animate the toggle button.
          AnimatedPositioned(
            // Set the duration of the animation.
            duration: const Duration(milliseconds: 2),

            // Set the curve of the animation.
            curve: Curves.easeIn,

            // Set the top, left, and right positions of the toggle button.
            top: 1,
            left: toggleValue ? 22.0 : 0.0,
            right: toggleValue ? 0.0 : 22.0,

            // Create a GestureDetector to handle taps on the toggle button.
            child: GestureDetector(
              // Handle taps on the toggle button.
              onTap: toggleButton,

              // Create an AnimatedSwitcher to animate the toggle button.
              child: AnimatedSwitcher(
                // Set the duration of the animation.
                duration: const Duration(milliseconds: 2),

                // Set the child of the AnimatedSwitcher.
                child: toggleValue
                    ? // If the toggleValue is true, show a blue circle.
                    CircleAvatar(
                        backgroundColor: const Color(0xffD6E4FF),
                        radius: 12.0,
                        key: UniqueKey(),
                      )
                    : // If the toggleValue is false, show a gray circle.
                    CircleAvatar(
                        backgroundColor: const Color(0xffF4F4F5),
                        radius: 12.0,
                        key: UniqueKey(),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Define the toggleButton method.
  void toggleButton() {
    // Update the toggleValue variable.
    setState(() {
      toggleValue = !toggleValue;
    });
  }
}
