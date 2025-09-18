import 'package:e_commerce_app/domain/entity/product/product.dart';

class ProductPriceHelper {
  static double provideCurrentPrice(Product product) {
    return product.discountedPrice != 0
        ? product.discountedPrice.toDouble()
        : product.price.toDouble();
  }
}
