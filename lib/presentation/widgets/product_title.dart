import 'package:e_commerce_app/domain/entity/product/product.dart';
import 'package:flutter/material.dart';

class ProductTitle extends StatelessWidget {
  final Product product;
  const ProductTitle({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        product.title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
