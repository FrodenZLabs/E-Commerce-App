import 'package:e_commerce_app/core/helper/product_price.dart';
import 'package:e_commerce_app/data/models/order/add_to_cart_model.dart';
import 'package:e_commerce_app/domain/entity/product/product.dart';
import 'package:e_commerce_app/presentation/bloc/order/add_to_cart_cubit.dart';
import 'package:e_commerce_app/presentation/bloc/product/product_color_selection_cubit.dart';
import 'package:e_commerce_app/presentation/bloc/product/product_quantity_cubit.dart';
import 'package:e_commerce_app/presentation/bloc/product/product_size_selection_cubit.dart';
import 'package:e_commerce_app/presentation/widgets/basic_reactive_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AddToCart extends StatelessWidget {
  final Product product;

  const AddToCart({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat('#,###');

    return BlocListener<AddToCartCubit, AddToCartState>(
      listener: (context, state) {
        if (state is AddToCartSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Added to cart successfully!')),
          );
          // AppNavigator.push(context, CartPage());
        }
        if (state is AddToCartError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: Padding(
        padding: EdgeInsets.all(16),
        child: BasicReactiveButton(
          onPressed: () {
            final quantity = context.read<ProductQuantityCubit>().state;
            final sizeIndex = context
                .read<ProductSizeSelectionCubit>()
                .selectedIndex;
            final colorIndex = context
                .read<ProductColorSelectionCubit>()
                .selectedIndex;

            final model = AddToCartModel(
              productId: product.productId,
              productTitle: product.title,
              productQuantity: quantity,
              productColor: product.colors[colorIndex].title,
              productSize: product.sizes[sizeIndex],
              productPrice: product.price.toDouble(),
              totalPrice:
                  ProductPriceHelper.provideCurrentPrice(product) * quantity,
              productImage: product.images[0],
              createdDate: DateTime.now().toString(),
            );

            context.read<AddToCartCubit>().addToCart(model);
          },
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocBuilder<ProductQuantityCubit, int>(
                builder: (context, state) {
                  final totalPrice =
                      ProductPriceHelper.provideCurrentPrice(product) * state;
                  return Text(
                    "Kshs. ${formatter.format(totalPrice)}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
              Text(
                'Add To Cart',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
