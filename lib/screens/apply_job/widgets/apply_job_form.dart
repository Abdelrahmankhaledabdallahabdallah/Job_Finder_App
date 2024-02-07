// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:job_finder_app/custom_widgets/phone_text_field.dart';

import '../../../custom_widgets/custom_button.dart';
import '../../../custom_widgets/custom_textfield.dart';
import '../../../utils/app_images.dart';
import 'apply_form_headline.dart';
import 'apply_form_title.dart';
import 'apply_job_type_of_work.dart';
import 'applying_process.dart';

class ApplyJobForm extends StatefulWidget {
  const ApplyJobForm({
    super.key,
    required this.jobId,
  });
  final int jobId;

  @override
  State<ApplyJobForm> createState() => _ApplyJobFormState();
}

class _ApplyJobFormState extends State<ApplyJobForm> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String name = '';
  String email = '';
  String phone = '';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ApplyingProcess(
            currentStep: 1,
          ),
          const SizedBox(height: 25),
          const ApplyFormHeadline(
            headline: 'Biodata',
            subheadline: 'Fill in your bio data correctly',
          ),
          Column(
            children: [
              Form(
                key: _formKey,
                autovalidateMode: autovalidateMode,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ApplyFormTitle(title: 'Full Name'),
                    CustomTextField(
                      hintText: 'Full Name',
                      image: AppImages.kProfile,
                      isPasswordCorrect: true,
                      onSaved: (value) {
                        name = value!.trim();
                      },
                    ),

                    // email textfield
                    const ApplyFormTitle(title: 'Email'),
                    CustomTextField(
                      hintText: 'Email',
                      image: AppImages.kEmail,
                      isPasswordCorrect: true,
                      onSaved: (value) {
                        email = value!.trim();
                      },
                    ),

                    const ApplyFormTitle(
                      title: 'No.Handphone',
                    ),

                    PhoneTextField(
                      autovalidateMode: autovalidateMode,
                      onSaved: (value) {
                        phone = value!.number.toString().trim();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          CustomButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState?.save();
                  try {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return ApplyJobTypeOfWork(
                            email: email,
                            name: name,
                            phone: phone,
                            jobId: widget.jobId);
                      },
                    ));
                  } catch (error) {
                    print('API request failed: $error');
                  }
                } else {
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
                  });
                }
              },
              text: 'Next'),
        ],
      ),
    );
  }
}
