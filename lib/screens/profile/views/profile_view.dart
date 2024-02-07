import 'package:flutter/material.dart';
import 'package:job_finder_app/screens/login/views/login_view.dart';
import 'package:job_finder_app/screens/profile/widgets/profile_view_body.dart';
import 'package:job_finder_app/utils/app_images.dart';
import 'package:job_finder_app/utils/constants.dart';


class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.arrow_back)),
              floating: true,
              pinned: false, // Make the app bar pinned when scrolling
              elevation: 0,
              iconTheme: const IconThemeData(
                color: Colors.black,
              ),
              backgroundColor: const Color(0xffD6E4FF),
              title: const Text(
                'Profile',
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
              actions: [
                GestureDetector(
                  onTap: () {
                    removeEmailFromSharedPreferences();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext ctx) => const LoginView()));
                  },
                  child: Image.asset(AppImages.kLogout),
                ),
              ],
            ),
            const SliverToBoxAdapter(
              child: ProfileViewBody(),
            ),
          ],
        ),
      ),
    );
  }
}
