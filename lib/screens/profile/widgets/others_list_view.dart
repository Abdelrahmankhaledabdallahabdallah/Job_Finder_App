import 'package:flutter/material.dart';
import 'package:job_finder_app/utils/app_fonts.dart';

import '../help_center/views/help_center_view.dart';
import '../privacy_policy/views/privacy_policy_view.dart';
import '../terms_conditions/views/terms_conditions_view.dart';

class OthersListView extends StatefulWidget {
  const OthersListView({
    super.key,
  });

  @override
  State<OthersListView> createState() => _OthersListViewState();
}

class _OthersListViewState extends State<OthersListView> {
  List<String> others = [
    'Accesibility',
    'Help Center',
    'Terms & Conditions',
    'Privacy Policy'
  ];

  // List<dynamic> screen = [AccesibilityView(), HelpCenterView(), TermsConditionsView(), PrivacyPolicy()];
  List<dynamic> screen = [
    const HelpCenterView(),
    const HelpCenterView(),
    const TermsConditionsView(),
    const PrivacyPolicyView()
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.separated(
        itemCount: others.length,
        shrinkWrap: true, // Set shrinkWrap to true
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return screen[index];
                },
              ),
            ),
            trailing: const Icon(Icons.arrow_forward),
            title: Text(
              others[index],
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xff111827),
                fontFamily: AppFonts.kLoginSubHeadlineFont,
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              thickness: 1,
            ),
          );
        },
      ),
    );
  }
}
