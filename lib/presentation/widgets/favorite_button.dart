import 'package:e_commerce_app/core/configs/theme/app_colors.dart';
import 'package:e_commerce_app/domain/entity/product/product.dart';
import 'package:e_commerce_app/presentation/bloc/product/favorite_icon_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteButton extends StatelessWidget {
  final Product product;
  const FavoriteButton({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.read<FavoriteIconCubit>().onTap(product);
      },
      icon: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: AppColors.secondBackground,
          shape: BoxShape.circle,
        ),
        child: BlocBuilder<FavoriteIconCubit, bool>(
          builder: (context, state) => Icon(
            state ? Icons.favorite : Icons.favorite_outline,
            size: 15,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
