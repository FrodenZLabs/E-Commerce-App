import 'package:e_commerce_app/domain/entity/product/color.dart';

class ProductColorModel {
  final String title;
  final List<int> rgb;

  ProductColorModel({required this.title, required this.rgb});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'title': title, 'rgb': rgb};
  }

  factory ProductColorModel.fromMap(Map<String, dynamic> map) {
    return ProductColorModel(
      title: map['title'] as String,
      rgb: List<int>.from(map['rgb'].map((e) => e)),
    );
  }
}

extension ProductColorXModel on ProductColorModel {
  ProductColor toEntity() {
    return ProductColor(title: title, rgb: rgb);
  }
}

extension ProductColorXEntity on ProductColor {
  ProductColorModel fromEntity() {
    return ProductColorModel(title: title, rgb: rgb);
  }
}
