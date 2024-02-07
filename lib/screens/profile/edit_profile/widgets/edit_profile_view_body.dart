import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_finder_app/cubits/profile_cubit/profile_cubit.dart';

import '../../../../custom_widgets/custom_button.dart';
import '../../../../utils/app_fonts.dart';
import 'edit_profile_form.dart';
import 'edit_user_image.dart';

class EditProfileViewBody extends StatelessWidget {
  const EditProfileViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        const EditUserImage(),
        const SizedBox(height: 10),
        const Center(
          child: Text(
            'Change Photo',
            style: TextStyle(
              color: Color(0xff3366FF),
              fontFamily: AppFonts.kLoginHeadlineFont,
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(height: 20),
        const EditProfileForm(),
        CustomButton(
            onPressed: () {
              BlocProvider.of<ProfileCubit>(context).fetchProfileData();
              Navigator.pop(context);
            },
            text: 'Save')
      ],
    );
  }
}
