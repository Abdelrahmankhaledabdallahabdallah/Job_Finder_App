import 'package:flutter/material.dart';
import 'package:job_finder_app/utils/app_fonts.dart';

class TermsConditionsView extends StatefulWidget {
  const TermsConditionsView({super.key});

  @override
  State<TermsConditionsView> createState() => _TermsConditionsViewState();
}

class _TermsConditionsViewState extends State<TermsConditionsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Terms & Conditions',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Lorem ipsum dolor',
              style: TextStyle(
                color: Color(0xff111827),
                fontSize: 20,
                fontFamily: AppFonts.kLoginHeadlineFont,
              ),
            ),
            // const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(top: 10, right: 16),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at.',
                style: TextStyle(
                  color: Color(0xff6B7280),
                  fontSize: 14,
                  fontFamily: AppFonts.kLoginSubHeadlineFont,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Lorem ipsum dolor',
              style: TextStyle(
                color: Color(0xff111827),
                fontSize: 20,
                fontFamily: AppFonts.kLoginHeadlineFont,
              ),
            ),
            // const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(top: 10, right: 16),
              child: Text(
                'Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
                style: TextStyle(
                  color: Color(0xff6B7280),
                  fontSize: 14,
                  fontFamily: AppFonts.kLoginSubHeadlineFont,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(16),
              color: const Color(0xffF4F4F5),
              child: const Text(
                'Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ',
                style: TextStyle(
                  color: Color(0xff6B7280),
                  fontSize: 14,
                  fontFamily: AppFonts.kLoginSubHeadlineFont,
                ),
              ),
            ),
            // const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(top: 10, right: 16),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ',
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
    );
  }
}
