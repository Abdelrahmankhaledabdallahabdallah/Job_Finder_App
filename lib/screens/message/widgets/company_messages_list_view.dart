import 'package:flutter/material.dart';
import 'package:job_finder_app/utils/app_fonts.dart';

import '../../../utils/app_images.dart';
import 'message_item.dart';

class CompanyMessagesListView extends StatefulWidget {
  const CompanyMessagesListView({
    super.key,
  });

  @override
  State<CompanyMessagesListView> createState() =>
      _CompanyMessagesListViewState();
}

class _CompanyMessagesListViewState extends State<CompanyMessagesListView> {
  List<String> title = ['Dana', 'Shoope', 'Slack', 'Facebook'];

  List<String> image = [
    AppImages.kDanaLogo,
    AppImages.kShoopeLogo,
    AppImages.kSlackLogo,
    AppImages.kFacebookLogoLarger,
  ];

  List<String> time = [
    'Yesterday',
    '09.45',
    '12/8',
    '12/8',
  ];

  List<String> content = [
    'Thank you for your attention!',
    'Thank You David!',
    'You: I look forward to hearing from you',
    'You: What about the interview stage?',
  ];

  List<bool> isReaded = [false, true, true, true];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: title.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return MessageCompanyItem(
                  company: title[index],
                  title: title[index],
                  image: image[index],
                  id: index,
                );
              },
            ),
          ),
          title: Text(
            title[index],
          ),
          leading: isReaded[index] == true
              ? Image.asset(
                  image[index],
                )
              : Stack(
                  children: [
                    Image.asset(
                      image[index],
                    ),
                    const CircleAvatar(
                      radius: 9,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 8,
                        backgroundColor: Color(0xff3366FF),
                        child: Text(
                          '1',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                            fontFamily: AppFonts.kLoginHeadlineFont,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
          subtitle: Text(
            content[index],
            style: const TextStyle(
              fontSize: 12,
              fontFamily: AppFonts.kLoginSubHeadlineFont,
              color: Color(0xff6B7280),
            ),
          ),
          trailing: Text(
            time[index],
            style: TextStyle(
              fontSize: 12,
              fontFamily: AppFonts.kLoginSubHeadlineFont,
              color: isReaded[index]
                  ? const Color(0xff6B7280)
                  : const Color(0xff3366FF),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 55),
          child: Divider(
            thickness: 1,
          ),
        );
      },
    );
  }
}
