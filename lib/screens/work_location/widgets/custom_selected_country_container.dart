// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class CustomSelectedCountryContainer extends StatefulWidget {
  const CustomSelectedCountryContainer({
    super.key,
    required this.flag,
    required this.country_name,
    this.onTap,
    required this.isClicked,
  });
  final String flag;
  final String country_name;
  final void Function()? onTap;
  final bool isClicked;

  @override
  State<CustomSelectedCountryContainer> createState() =>
      _CustomSelectedCountryContainerState();
}

class _CustomSelectedCountryContainerState
    extends State<CustomSelectedCountryContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.only(top: 4, bottom: 4, left: 10, right: 10),
        decoration: BoxDecoration(
            color:
                widget.isClicked ? const Color(0xffD6E4FF) : const Color(0xffFAFAFA),
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color:
                  widget.isClicked ? const Color(0xff3366FF) : const Color(0xffD1D5DB),
            ),
            boxShadow: widget.isClicked
                ? [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ]
                : []),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor:
                  widget.isClicked ? Colors.white : const Color(0xffFAFAFA),
              radius: 16,
              child: Image.asset(widget.flag),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              widget.country_name,
              style: const TextStyle(
                color: Color(0xff111827),
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
