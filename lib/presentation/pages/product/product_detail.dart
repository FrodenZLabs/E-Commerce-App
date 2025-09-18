import 'package:e_commerce_app/core/di/injection.dart';
import 'package:e_commerce_app/domain/entity/product/product.dart';
import 'package:e_commerce_app/presentation/bloc/product/favorite_icon_cubit.dart';
import 'package:e_commerce_app/presentation/widgets/app_bar.dart';
import 'package:e_commerce_app/presentation/widgets/favorite_button.dart';
import 'package:e_commerce_app/presentation/widgets/product_images.dart';
import 'package:e_commerce_app/presentation/widgets/product_price.dart';
import 'package:e_commerce_app/presentation/widgets/product_quantity.dart';
import 'package:e_commerce_app/presentation/widgets/product_title.dart';
import 'package:e_commerce_app/presentation/widgets/selected_color.dart';
import 'package:e_commerce_app/presentation/widgets/selected_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<FavoriteIconCubit>()..isFavorite(product.productId),
      child: Scaffold(
        appBar: BasicAppBar(
          hideBack: false,
          action: FavoriteButton(product: product),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductImages(product: product),
              const SizedBox(height: 10),
              ProductTitle(product: product),
              const SizedBox(height: 10),
              ProductPrice(product: product),
              const SizedBox(height: 20),
              SelectedSize(product: product),
              const SizedBox(height: 15),
              SelectedColor(product: product),
              const SizedBox(height: 15),
              ProductQuantity(product: product),
            ],
          ),
        ),
      ),
    );
  }
}
