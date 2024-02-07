import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_finder_app/cubits/profile_cubit/profile_cubit.dart';
import 'package:job_finder_app/utils/app_images.dart';

class UserProfileImage extends StatefulWidget {
  const UserProfileImage({
    super.key,
  });

  @override
  State<UserProfileImage> createState() => _UserProfileImageState();
}

class _UserProfileImageState extends State<UserProfileImage> {
  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.read<ProfileCubit>().fetchProfileData();

    double coverHeight = MediaQuery.of(context).size.height * 0.13;
    double profileHeight = MediaQuery.of(context).size.height * 0.13;
    final top = coverHeight - profileHeight / 2;
    final bottom = profileHeight / 2;
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ProfileSuccess) {
          return Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: bottom),
                color: const Color(0xffD6E4FF),
                width: double.infinity,
                height: coverHeight,
              ),
              Positioned(
                top: top,
                child: CircleAvatar(
                  radius: profileHeight / 2 + 4,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(state.userPortofolio.image!),
                    backgroundColor: Colors.white,
                    radius: profileHeight / 2,
                  ),
                ),
              )
            ],
          );
        } else if (state is ProfileFailure) {
          return Text(
            state.errMessage,
            style: const TextStyle(color: Colors.red),
          );
        } else if (state is ProfileNoData) {
          return Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: bottom),
                color: const Color(0xffD6E4FF),
                width: double.infinity,
                height: coverHeight,
              ),
              Positioned(
                top: top,
                child: CircleAvatar(
                  radius: profileHeight / 2 + 4,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    backgroundImage: const AssetImage(AppImages.kProfile),
                    backgroundColor: Colors.white,
                    radius: profileHeight / 2,
                  ),
                ),
              ),
            ],
          );
        } else {
          return const Text(
            'opps!!',
            style: TextStyle(color: Colors.red),
          );
        }
      },
    );
  }
}
