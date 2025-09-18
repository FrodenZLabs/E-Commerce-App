import 'package:e_commerce_app/core/configs/theme/app_colors.dart';
import 'package:e_commerce_app/core/helper/bottomsheet/app_bottomsheet.dart';
import 'package:e_commerce_app/domain/entity/product/product.dart';
import 'package:e_commerce_app/presentation/bloc/product/product_color_selection_cubit.dart';
import 'package:e_commerce_app/presentation/widgets/product_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedColor extends StatelessWidget {
  final Product product;
  const SelectedColor({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppBottomSheet.display(
          context,
          BlocProvider.value(
            value: BlocProvider.of<ProductColorSelectionCubit>(context),
            child: ProductColors(product: product),
          ),
        );
      },
      child: Container(
        height: 60,
        margin: EdgeInsets.symmetric(horizontal: 16),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.secondBackground,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Text(
              'Color',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            Row(
              children: [
                BlocBuilder<ProductColorSelectionCubit, int>(
                  builder: (context, state) {
                    if (product.colors.isEmpty) {
                      return Text(
                        "No colors available",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      );
                    }
                    // fallback index if state is out of range
                    final safeIndex =
                        (state >= 0 && state < product.colors.length)
                        ? state
                        : 0;

                    final color = product.colors[safeIndex].rgb;

                    return Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(color[0], color[1], color[2], 1),
                      ),
                    );
                  },
                ),

                SizedBox(width: 15),
                Icon(Icons.keyboard_arrow_down, size: 30),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
