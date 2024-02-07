import 'package:flutter/material.dart';
import 'package:job_finder_app/screens/profile/views/profile_view.dart';

import '../../../utils/app_images.dart';
import '../../applied/views/applied_view.dart';
import '../../message/views/message_view.dart';
import '../../saved/views/saved_view.dart';
import '../widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  static const String id = 'home_view';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  int _currentIndex = 0;
  final tabs = [
    const HomeViewBody(),
    const MessageView(),
    const AppliedView(),
    const SavedView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: tabs[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xff3366FF),
        selectedFontSize: 10,
        unselectedFontSize: 10,
        unselectedItemColor: const Color(0xff9CA3AF),
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
                _currentIndex == 0 ? AppImages.kHomeColor : AppImages.kHome),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(_currentIndex == 1
                ? AppImages.kMessageColor
                : AppImages.kMessage),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(_currentIndex == 2
                ? AppImages.kBriefcaseColor
                : AppImages.kApply),
            label: 'Applied',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(_currentIndex == 3
                ? AppImages.kArchiveMinusColor
                : AppImages.kArchive),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(_currentIndex == 4
                ? AppImages.kProfileColor
                : AppImages.kProfile),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
