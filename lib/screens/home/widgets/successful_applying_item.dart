import 'package:flutter/material.dart';
import 'package:job_finder_app/models/jobs_model.dart';
import 'package:job_finder_app/screens/message/views/message_view.dart';
import 'package:job_finder_app/utils/app_fonts.dart';

class SuccessfulApplyingItem extends StatefulWidget {
  const SuccessfulApplyingItem({super.key, required this.job});
  final JobsModel job;

  @override
  State<SuccessfulApplyingItem> createState() => _SuccessfulApplyingItemState();
}

class _SuccessfulApplyingItemState extends State<SuccessfulApplyingItem> {
  bool isAccepted = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isAccepted = !isAccepted;
          if (isAccepted == true) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MessageView(),
                ));
          }
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xffD6E4FF),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  widget.job.image!,
                  width: 40,
                  height: 40,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: [
                  const SizedBox(width: 50),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.job.comp_name.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xff222741),
                          fontFamily: AppFonts.kLoginHeadlineFont,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Waiting to be selected by the \n${widget.job.comp_name} team',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xff374151),
                          fontFamily: AppFonts.kLoginSubHeadlineFont,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                        color: isAccepted
                            ? const Color(0xffB2ED82)
                            : const Color(0xffADC8FF),
                        borderRadius: BorderRadius.circular(100)),
                    child: Text(
                      isAccepted ? 'Accepted' : 'Submitted',
                      style: TextStyle(
                        fontSize: 12,
                        color: isAccepted
                            ? const Color(0xff1B720F)
                            : const Color(0xff1939B7),
                        fontFamily: AppFonts.kLoginSubHeadlineFont,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
