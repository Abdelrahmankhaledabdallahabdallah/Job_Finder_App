import 'package:flutter/cupertino.dart';
import 'package:job_finder_app/custom_widgets/social_recommendations.dart';
import '../../utils/app_images.dart';

class SocialRegister extends StatelessWidget {
  const SocialRegister({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SocialRecommendations(
          image: AppImages.kGoogleLogo,
          text: 'Google',
          onPressed: () {},
        ),
        const Spacer(),
        SocialRecommendations(
          onPressed: () {},
          image: AppImages.kFacebookLogo,
          text: 'Facebook',
        )
      ],
    );
  }
}
