import 'package:e_commerce_app/core/configs/theme/app_colors.dart';
import 'package:e_commerce_app/domain/entity/product/product.dart';
import 'package:e_commerce_app/presentation/bloc/product/product_color_selection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductColors extends StatelessWidget {
  final Product product;
  const ProductColors({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16),
          topLeft: Radius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
            child: Stack(
              children: [
                Center(
                  child: Text(
                    'Color',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.close),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 20),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return BlocBuilder<ProductColorSelectionCubit, int>(
                  builder: (context, state) => GestureDetector(
                    onTap: () {
                      context.read<ProductColorSelectionCubit>().itemSelection(
                        index,
                      );
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 40,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: state == index
                            ? AppColors.primary
                            : AppColors.secondBackground,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            product.colors[index].title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(
                                    product.colors[index].rgb[0],
                                    product.colors[index].rgb[1],
                                    product.colors[index].rgb[2],
                                    1,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(width: 15),
                              state == index
                                  ? Icon(Icons.check, size: 30)
                                  : Container(width: 30),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemCount: product.colors.length,
            ),
          ),
        ],
      ),
    );
  }
}
