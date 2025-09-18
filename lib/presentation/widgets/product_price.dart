import 'package:e_commerce_app/core/configs/theme/app_colors.dart';
import 'package:e_commerce_app/domain/entity/product/product.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductPrice extends StatelessWidget {
  final Product product;
  const ProductPrice({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat('#,###');

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        product.discountedPrice != 0
            ? "Kshs. ${formatter.format(product.discountedPrice)}"
            : "Kshs. ${formatter.format(product.price)}",
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: AppColors.primary,
        ),
      ),
    );
  }
}
