// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'custom_selected_work_type.dart';

class CustomContainerTypes extends StatefulWidget {
  const CustomContainerTypes({
    super.key,
    required this.icon,
    required this.work_type,
    this.onTap,
    required this.isClicked,
  });
  final String icon;
  final String work_type;
  final void Function()? onTap;
  final bool isClicked;

  @override
  State<CustomContainerTypes> createState() => _CustomContainerTypesState();
}

class _CustomContainerTypesState extends State<CustomContainerTypes> {
  // bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: CustomSelectedWorkType(
        icon: widget.icon,
        isClicked: widget.isClicked,
        work_type: widget.work_type,
      ),
    );
  }
}
