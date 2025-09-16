import 'package:e_commerce_app/core/configs/assets/app_images.dart';
import 'package:e_commerce_app/core/configs/assets/app_vectors.dart';
import 'package:e_commerce_app/core/configs/theme/app_colors.dart';
import 'package:e_commerce_app/domain/entity/auth/user.dart';
import 'package:e_commerce_app/presentation/bloc/user_info/user_info_display_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, right: 16, left: 16),
      child: BlocBuilder<UserInfoDisplayCubit, UserInfoDisplayState>(
        builder: (context, state) {
          if (state is UserInfoDisplayLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is UserInfoDisplayLoaded) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _profileImage(state.user, context),
                _gender(state.user),
                _card(context),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _profileImage(User user, BuildContext context) {
    return GestureDetector(
      onTap: () {
        // AppNavigator.push(context, SettingsPage());
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: user.image.isEmpty
                ? const AssetImage(AppImages.profile)
                : NetworkImage(user.image),
          ),
          color: Colors.red,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  Widget _gender(User user) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: AppColors.secondBackground,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Text(
          user.gender == 1 ? 'Men' : 'Women',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Widget _card(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // AppNavigator.push(context, CartPage());
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(AppVectors.bag, fit: BoxFit.none),
      ),
    );
  }
}
