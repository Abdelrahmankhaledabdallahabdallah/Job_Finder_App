import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_fonts.dart';

// 1- Our custom text field widget
class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key, // 2- super key for a stateful widget
    required this.hintText, // 3- the hint text for the text field
    required this.image, // 4- the image for the text field
    required this.isPasswordCorrect, // 5- to check if the password is correct
    this.onChanged, // 6- the onChanged callback
    this.onSaved, // 7- the onSaved callback
  });

  final String hintText;
  final String image;
  final bool isPasswordCorrect;
  final void Function(String)? onChanged; // 8- the onChanged callback type
  final void Function(String?)? onSaved; // 9- the onSaved callback type

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

// 10- the state for the custom text field
class _CustomTextFieldState extends State<CustomTextField> {
  // 7- to see the focus on each textfield
  final FocusNode _textFieldFocusNode = FocusNode();
  bool isObscure = true; // 11- to obscure the password
  bool isTextFieldFocused = false; // 12- to check if the text field is focused

  @override
  void initState() {
    super.initState();
    _textFieldFocusNode.addListener(_handleFocusChange); // 13- add a listener to the focus node
  }

  @override
  void dispose() {
    _textFieldFocusNode.removeListener(_handleFocusChange); // 14- remove the listener from the focus node
    _textFieldFocusNode.dispose(); // 15- dispose the focus node
    super.dispose();
  }

  void _handleFocusChange() {
    setState(() {
      isTextFieldFocused = _textFieldFocusNode.hasFocus; // 16- set the isTextFieldFocused state
    });
  }

  RegExp get _emailRegex => RegExp(r'^\S+@\S+$'); // 17- a regular expression for email validation

  @override
  Widget build(BuildContext context) {
    // 18- the text field widget
    return TextFormField(
      decoration: InputDecoration(
        // 1- the icon and the hint text
        // the text in the text field
        hintText: widget.hintText,
        // hint style
        hintStyle: const TextStyle(
          color: AppColors.kRegisterHints,
          fontSize: 14,
          fontFamily: AppFonts.kRegisterHintFont,
        ),
        prefixIcon: ColorFiltered(
          colorFilter: ColorFilter.mode(
            // 2- change the color of the icon based on the focus and the password correctness
            (isTextFieldFocused || !widget.isPasswordCorrect)
                ? Colors.black
                : Colors.grey,
            BlendMode.modulate,
          ),
          child: Image.asset(widget.image),
        ),

        // 2- border color and radius
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: widget.isPasswordCorrect
                ? AppColors.kBoarderColor
                : widget.hintText == 'Password'
                    ? const Color(0xffFF472B)
                    : AppColors.kBorderFocusColor,
          ),
        ),

        // 3- the focus border
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: widget.hintText == 'Password'
                ? (widget.isPasswordCorrect
                    ? AppColors.kBorderFocusColor
                    : const Color(0xffFF472B))
                : AppColors.kBorderFocusColor,
          ),
        ),

        // 4- the error border
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: Color(0xffFF472B),
          ),
        ),

        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),

        // 5- if the text field is for the password
        suffixIcon: (widget.hintText == 'Password' ||
                widget.hintText.contains('password'))
            ? IconButton(
                icon: isObscure
                    ? Icon(
                        Icons.visibility_off_outlined,
                        color: (isTextFieldFocused || !widget.isPasswordCorrect)
                            ? Colors.black
                            : Colors.grey,
                      )
                    : Icon(
                        Icons.visibility_outlined,
                        color: (isTextFieldFocused || !widget.isPasswordCorrect)
                            ? Colors.black
                            : Colors.grey,
                      ),
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure; // 19- toggle the obscure state
                  });
                },
              )
            : null,
      ),

      // 6- to check if I want the entered data to be shown
      // if the user reach to password text field then obscur the text
      obscureText: (widget.hintText == 'Password' ||
              widget.hintText.contains('password'))
          ? isObscure
          : !isObscure,

      // 8- initial the focus node
      focusNode: _textFieldFocusNode,

      // 9- the validation
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your ${widget.hintText}';
        }
        if (widget.hintText == 'Email') {
          if (!_emailRegex.hasMatch(value)) {
            return 'Email address is not valid';
          }
        }

        return null;
      },
      onChanged: widget.onChanged,

      onSaved: widget.onSaved,
    );
  }
}
