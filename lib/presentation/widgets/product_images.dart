import 'package:e_commerce_app/domain/entity/product/product.dart';
import 'package:flutter/material.dart';

class ProductImages extends StatelessWidget {
  final Product product;
  const ProductImages({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(product.images[index]),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: product.images.length,
      ),
    );
  }
}
