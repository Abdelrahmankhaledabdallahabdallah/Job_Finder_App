// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:job_finder_app/models/jobs_model.dart';
import 'package:job_finder_app/utils/app_images.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_fonts.dart';

class PeopleApplied extends StatefulWidget {
  const PeopleApplied({
    super.key,
    required this.jobsModel,
  });

  final JobsModel jobsModel;

  @override
  State<PeopleApplied> createState() => _PeopleAppliedState();
}

class _PeopleAppliedState extends State<PeopleApplied> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.055,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Text(
                '${widget.jobsModel.favorites} Employees For',
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: AppFonts.kLoginHeadlineFont,
                  color: AppColors.kLoginHeadlines,
                ),
              ),
              const Positioned(
                bottom: 1,
                child: Text(
                  'UI/UX Design',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: AppFonts.kLoginSubHeadlineFont,
                    color: Color(0xff6B7280),
                  ),
                ),
              ),
              const Positioned(
                right: 1,
                child: CustomDropdownButton(),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: Container(
            child: ListView.separated(
              itemCount: 8,
              itemBuilder: (context, index) {
                return const EmployeesData();
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  thickness: 1,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class EmployeesData extends StatelessWidget {
  const EmployeesData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(AppImages.kProfileUser),
          ),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dimas Adi Saputro',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: AppFonts.kLoginHeadlineFont,
                  color: Color(0xff111827),
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Senior UI/UX Designer at Twitter',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: AppFonts.kLoginSubHeadlineFont,
                  color: Color(0xff6B7280),
                ),
              ),
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Work during',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: AppFonts.kLoginSubHeadlineFont,
                  color: Color(0xff6B7280),
                ),
              ),
              SizedBox(height: 5),
              Text(
                '5 Years',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: AppFonts.kLoginHeadlineFont,
                  color: Color(0xff3366FF),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomDropdownButton extends StatefulWidget {
  const CustomDropdownButton({super.key});

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  TextEditingController controller = TextEditingController();
  List<String> list = <String>['One', 'Two', 'Three', 'Four'];
  bool displayValue = false;
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        inputField(),
        displayValue ? selectionField() : Container(),
      ],
    );
  }

  Widget inputField() {
    return Container(
      padding: const EdgeInsets.only(left: 16.0, bottom: 4.0),
      height: 40,
      width: 130,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
      ),
      child: TextField(
        style: const TextStyle(
          fontSize: 12,
          fontFamily: AppFonts.kLoginSubHeadlineFont,
          color: Color(0xff111827),
        ),
        controller: controller,
        decoration: InputDecoration(
          hintText: list[0],
          hintStyle: const TextStyle(
            fontSize: 12,
            fontFamily: AppFonts.kLoginSubHeadlineFont,
            color: Color(0xff111827),
          ),
          border: InputBorder.none,
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                displayValue = !displayValue;
                isSelected = !isSelected;
              });
            },
            child: Icon(
              isSelected ? Icons.arrow_drop_up : Icons.arrow_drop_down,
            ),
          ),
        ),
      ),
    );
  }

  Widget selectionField() {
    return Container(
      height: 200,
      width: 130,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                controller.text = list[index];
              });
            },
            child: ListTile(
              title: Text(
                list[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
