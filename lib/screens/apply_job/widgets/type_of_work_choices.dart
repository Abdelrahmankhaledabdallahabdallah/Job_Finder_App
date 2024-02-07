import 'package:flutter/material.dart';
import 'package:job_finder_app/utils/app_colors.dart';

import '../../../utils/app_fonts.dart';
import 'custom_radio_button.dart';

class TypeOfWorkChoices extends StatefulWidget {
  const TypeOfWorkChoices({
    super.key,
    required this.onWorkTypeSelected,
  });
  final Function(String)
      onWorkTypeSelected; // Callback function to notify the parent widget

  @override
  State<TypeOfWorkChoices> createState() => _TypeOfWorkChoicesState();
}

class _TypeOfWorkChoicesState extends State<TypeOfWorkChoices> {
  String selectedWorkType = '';

  List<String> works = [
    'Senior UX Designer',
    'Senior UI Designer',
    'Graphik Designer',
    'Front-End Developer'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListView.builder(
        itemCount: works.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          bool isSelected = selectedWorkType == works[index];

          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xffD6E4FF) : Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      color: isSelected
                          ? AppColors.kBorderFocusColor
                          : AppColors.kBoarderColor),
                ),
                child: ListTile(
                  title: Text(
                    works[index],
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xff111827),
                      fontFamily: AppFonts.kLoginHeadlineFont,
                    ),
                  ),
                  subtitle: const Text(
                    'CV.pdf • Portfolio.pdf',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff6B7280),
                      fontFamily: AppFonts.kLoginSubHeadlineFont,
                    ),
                  ),
                  trailing: CustomRadioButton(isSelected: isSelected),
                  onTap: () {
                    setState(() {
                      selectedWorkType =
                          works[index]; // Set the selected work type
                      widget.onWorkTypeSelected(selectedWorkType);
                    });
                  },
                ),
              ),
              const SizedBox(height: 10),
            ],
          );
        },
      ),
    );
  }
}
