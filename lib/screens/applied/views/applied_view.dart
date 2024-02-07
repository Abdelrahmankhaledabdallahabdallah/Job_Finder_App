import 'package:flutter/material.dart';
import '../../../utils/app_fonts.dart';
import '../widgets/applied_view_body.dart';

class AppliedView extends StatefulWidget {
  const AppliedView({super.key});

  @override
  State<AppliedView> createState() => _AppliedViewState();
}

class _AppliedViewState extends State<AppliedView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Applied Job',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: AppFonts.kLoginHeadlineFont,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: const AppliedViewBody(),
    );
  }
}
