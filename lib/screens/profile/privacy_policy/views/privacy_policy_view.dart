import 'package:flutter/material.dart';

import '../../../../utils/app_fonts.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Privacy Policy',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your privacy is important',
                style: TextStyle(
                  color: Color(0xff111827),
                  fontSize: 20,
                  fontFamily: AppFonts.kLoginHeadlineFont,
                ),
              ),
              // const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(top: 10, right: 16),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ',
                  style: TextStyle(
                    color: Color(0xff6B7280),
                    fontSize: 14,
                    fontFamily: AppFonts.kLoginSubHeadlineFont,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, right: 16),
                child: Text(
                  'Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ',
                  style: TextStyle(
                    color: Color(0xff6B7280),
                    fontSize: 14,
                    fontFamily: AppFonts.kLoginSubHeadlineFont,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Data controllers and contract partners',
                style: TextStyle(
                  color: Color(0xff111827),
                  fontSize: 20,
                  fontFamily: AppFonts.kLoginHeadlineFont,
                ),
              ),
              // const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(top: 10, right: 16),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ',
                  style: TextStyle(
                    color: Color(0xff6B7280),
                    fontSize: 14,
                    fontFamily: AppFonts.kLoginSubHeadlineFont,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, right: 16),
                child: Text(
                  'Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ',
                  style: TextStyle(
                    color: Color(0xff6B7280),
                    fontSize: 14,
                    fontFamily: AppFonts.kLoginSubHeadlineFont,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
