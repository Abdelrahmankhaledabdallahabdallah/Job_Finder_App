import 'package:flutter/material.dart';
import 'package:job_finder_app/screens/saved/widgets/saved_view_body.dart';

class SavedView extends StatelessWidget {
  const SavedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const Icon(Icons.arrow_back),
        title: const Text(
          'Saved',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: const SafeArea(
        child: SavedViewBody(),
      ),
    );
  }
}
