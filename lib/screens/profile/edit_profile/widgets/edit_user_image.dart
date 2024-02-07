
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../cubits/image_portfolio_cubit/image_portfolio_cubit.dart';
import '../../../../utils/app_images.dart';

class EditUserImage extends StatefulWidget {
  const EditUserImage({
    super.key,
  });

  @override
  State<EditUserImage> createState() => _EditUserImageState();
}

class _EditUserImageState extends State<EditUserImage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          BlocBuilder<ImagePortfolioCubit, ImagePortfolioState>(
            builder: (context, state) {
              if (state is ImagePortfolioLoading) {
                return const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(AppImages.kProfile),
                  backgroundColor: Colors.grey,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  ),
                );
              } else if (state is ImagePortfolioSuccess) {
                return CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(state.imageUrl),
                );
              } else {
                return const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(AppImages.kProfile),
                  backgroundColor: Colors.grey,
                );
              }
            },
          ),
          Positioned(
            bottom: 1,
            right: 1,
            left: 1,
            top: 1,
            child: GestureDetector(
              onTap: () async {
                BlocProvider.of<ImagePortfolioCubit>(context)
                    .uploadImage(ImageSource.gallery);
              },
              child: Image.asset(AppImages.kCamera),
            ),
          ),
        ],
      ),
    );
  }
}
