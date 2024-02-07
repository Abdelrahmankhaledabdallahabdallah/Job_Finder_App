import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({
    super.key,
    this.onChanged,
    this.controller,
    this.ontap,
  });

  final void Function(String?)? onChanged;
  final TextEditingController? controller;
  final void Function()? ontap;

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 10),
        prefixIcon: Image.asset(AppImages.kSearch),
        suffixIcon: widget.controller!.text.isNotEmpty
            ? GestureDetector(
                onTap: widget.ontap,
                child: ColorFiltered(
                  colorFilter:
                      const ColorFilter.mode(Colors.black, BlendMode.modulate),
                  child: Image.asset(AppImages.kCloseCircle),
                ),
              )
            : null,
        hintText: 'Type something...',
        hintStyle: const TextStyle(
          fontSize: 14,
          color: AppColors.kRegisterHints,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(
            color: Color(0xffD1D5DB),
          ),
        ),
      ),
    );
  }
}
