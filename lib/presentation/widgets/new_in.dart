import 'package:e_commerce_app/core/configs/theme/app_colors.dart';
import 'package:e_commerce_app/core/di/injection.dart';
import 'package:e_commerce_app/domain/entity/product/product.dart';
import 'package:e_commerce_app/domain/usecases/product/get_new_in_use_case.dart';
import 'package:e_commerce_app/presentation/bloc/product/products_display_cubit.dart';
import 'package:e_commerce_app/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewIn extends StatelessWidget {
  const NewIn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductsDisplayCubit(getIt<GetNewInUseCase>())..displayProducts(),
      child: BlocBuilder<ProductsDisplayCubit, ProductsDisplayState>(
        builder: (context, state) {
          if (state is ProductsDisplayLoading) {
            return CircularProgressIndicator();
          }

          if (state is ProductsLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _newIn(),
                SizedBox(height: 20),
                _products(state.products),
              ],
            );
          }

          return Container();
        },
      ),
    );
  }

  Widget _newIn() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        'New In',
        style: TextStyle(fontSize: 16, color: AppColors.primary),
      ),
    );
  }

  Widget _products(List<Product> products) {
    return SizedBox(
      height: 300,
      child: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ProductCard(product: products[index]);
        },
        separatorBuilder: (context, index) => SizedBox(width: 10),
        itemCount: products.length,
      ),
    );
  }
}
