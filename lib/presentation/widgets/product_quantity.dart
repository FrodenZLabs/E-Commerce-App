import 'package:e_commerce_app/core/configs/theme/app_colors.dart';
import 'package:e_commerce_app/domain/entity/product/product.dart';
import 'package:e_commerce_app/presentation/bloc/product/product_quantity_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductQuantity extends StatelessWidget {
  final Product product;
  const ProductQuantity({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.only(left: 12),
      decoration: BoxDecoration(
        color: AppColors.secondBackground,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Quantity',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  context.read<ProductQuantityCubit>().decrement();
                },
                icon: Container(
                  height: 49,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary,
                  ),
                  child: Center(child: Icon(Icons.remove, size: 30)),
                ),
              ),
              SizedBox(width: 10),
              BlocBuilder<ProductQuantityCubit, int>(
                builder: (context, state) => Text(
                  state.toString(),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(width: 10),
              IconButton(
                onPressed: () {
                  context.read<ProductQuantityCubit>().increment();
                },
                icon: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary,
                  ),
                  child: Center(child: Icon(Icons.add, size: 30)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
