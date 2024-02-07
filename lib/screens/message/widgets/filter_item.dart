import 'package:flutter/material.dart';
import 'package:job_finder_app/utils/app_fonts.dart';

class FilterItem extends StatelessWidget {
  const FilterItem({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> title = [
      'Unread',
      'Spam',
      'Archived',
    ];
    return ListView.builder(
      itemCount: title.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                
              },
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: const Color(0xffD1D5DB),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Text(
                        title[index],
                        style: const TextStyle(
                          color: Color(0xff374151),
                          fontSize: 16,
                          fontFamily: AppFonts.kLoginHeadlineFont,
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.keyboard_arrow_right_outlined,
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
          ],
        );
      },
    );
  }
}
