import 'package:flutter/material.dart';
import 'package:job_finder_app/utils/app_fonts.dart';
import 'package:job_finder_app/utils/app_images.dart';

class HelpCenterView extends StatefulWidget {
  const HelpCenterView({super.key});

  @override
  State<HelpCenterView> createState() => _HelpCenterViewState();
}

class _HelpCenterViewState extends State<HelpCenterView> {
  final List<Map<String, dynamic>> _items = List.generate(
      10,
      (index) => {
            'title': 'Lorem ipsum dolor sit amet',
            'content':
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ultricies mi enim, quis vulputate nibh faucibus at. Maecenas est ante, suscipit vel sem non, blandit blandit erat. Praesent pulvinar ante et felis porta vulputate. Curabitur ornare velit nec fringilla finibus. Phasellus mollis pharetra ante, in ullamcorper massa ullamcorper et. Curabitur ac leo sit amet leo interdum mattis vel eu mauris.'
          });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Help Center',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.07,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: Colors.grey),
                    ),
                  ),
                  Positioned(
                    bottom: 1,
                    top: 1,
                    child: Image.asset(AppImages.kSearch),
                  ),
                  const Positioned(
                    bottom: 15,
                    left: 50,
                    child: Text(
                      'What can we help?',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff9CA3AF),
                        fontFamily: AppFonts.kLoginSubHeadlineFont,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _items.length,
                  itemBuilder: (context, index) {
                    final item = _items[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: const Color(0xffD1D5DB),
                          ),
                        ),
                        child: ExpansionTile(
                          childrenPadding: const EdgeInsets.only(
                            right: 8,
                            left: 16,
                            bottom: 10,
                          ),
                          title: Text(
                            item['title'],
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color(0xff111827),
                              fontFamily: AppFonts.kLoginHeadlineFont,
                            ),
                          ),
                          iconColor: const Color(0xff9CA3AF),
                          collapsedIconColor: const Color(0xff9CA3AF),
                          children: [
                            Text(
                              item['content'],
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xff6B7280),
                                fontFamily: AppFonts.kLoginSubHeadlineFont,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
