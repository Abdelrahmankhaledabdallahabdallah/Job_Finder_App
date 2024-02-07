// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class CustomSelectedWorkType extends StatefulWidget {
  const CustomSelectedWorkType(
      {super.key,
      required this.isClicked,
      required this.icon,
      required this.work_type});
  final bool isClicked;
  final String icon;
  final String work_type;
  @override
  State<CustomSelectedWorkType> createState() => _CustomSelectedWorkTypeState();
}

class _CustomSelectedWorkTypeState extends State<CustomSelectedWorkType> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 23, bottom: 8, left: 16),
      decoration: BoxDecoration(
          color: widget.isClicked
              ? const Color(0xffD6E4FF)
              : const Color(0xffFAFAFA),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: widget.isClicked
                ? const Color(0xff3366FF)
                : const Color(0xffD1D5DB),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: widget.isClicked
                ? const Color(0xff3366FF)
                : const Color(0xffD1D5DB),
            radius: 27,
            child: CircleAvatar(
              backgroundColor:
                  widget.isClicked ? Colors.white : const Color(0xffFAFAFA),
              radius: 26,
              child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                      (widget.isClicked
                          ? Colors.blue
                          : const Color(0xff292D32)),
                      BlendMode.modulate),
                  child: Image.asset(widget.icon)),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            widget.work_type,
            style: const TextStyle(
              color: Color(0xff111827),
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
