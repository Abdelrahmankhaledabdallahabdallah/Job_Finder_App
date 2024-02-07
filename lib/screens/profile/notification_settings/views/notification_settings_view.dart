import 'package:flutter/material.dart';
import 'package:job_finder_app/utils/app_fonts.dart';

import '../../../../custom_widgets/custom_switch.dart';

class NotificationSettingsView extends StatefulWidget {
  const NotificationSettingsView({super.key});

  @override
  State<NotificationSettingsView> createState() => _NotificationSettingsViewState();
}

class _NotificationSettingsViewState extends State<NotificationSettingsView> {
  List<String> title = [
    'Your Job Search Alert',
    'Job Application Update',
    'Job Application Reminders',
    'Jobs You May Be Interested In',
    'Job Seeker Updates',
  ];
  List<String> otherNotification = [
    'Show Profile',
    'All Message',
    'Message Nudges',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Notification',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: const Color(0xffE5E7EB),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: const Text(
              'Job notification',
              style: TextStyle(
                color: Color(0xff6B7280),
                fontSize: 16,
                fontFamily: AppFonts.kLoginHeadlineFont,
              ),
            ),
          ),
          SizedBox(
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: title.length,
              itemBuilder: (context, index) {
                return ListTile(
                  trailing: const CustomSwitch(),
                  // trailing: Switch(value: true, onChanged: (value) {}),
                  title: Text(
                    title[index],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Divider(
                    thickness: 1,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            color: const Color(0xffE5E7EB),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: const Text(
              'Other notification',
              style: TextStyle(
                color: Color(0xff6B7280),
                fontSize: 16,
                fontFamily: AppFonts.kLoginHeadlineFont,
              ),
            ),
          ),
          SizedBox(
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: otherNotification.length,
              itemBuilder: (context, index) {
                return ListTile(
                  trailing: const CustomSwitch(),
                  title: Text(
                    otherNotification[index],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Divider(
                    thickness: 1,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}