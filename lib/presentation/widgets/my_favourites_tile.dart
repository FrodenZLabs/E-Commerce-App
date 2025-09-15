import 'package:e_commerce_app/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';

class MyFavouritesTile extends StatelessWidget {
  const MyFavouritesTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: AppColors.secondBackground,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'My Favourites',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            Icon(Icons.arrow_forward_ios_rounded),
          ],
        ),
      ),
    );
  }
}
