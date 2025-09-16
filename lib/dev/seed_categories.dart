import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future<void> seedCategories() async {
  final categories = [
    {
      "title": "Men's Fashion",
      "categoryId": "mens_fashion",
      "image":
          "https://res.cloudinary.com/danrxrws8/image/upload/v1758046740/mens_fashion_v0lx6a.jpg",
    },
    {
      "title": "Women's Fashion",
      "categoryId": "womens_fashion",
      "image":
          "https://res.cloudinary.com/danrxrws8/image/upload/v1758046647/female_fashion_k5vwh2.jpg",
    },
    {
      "title": "Shoes",
      "categoryId": "shoes",
      "image":
          "https://res.cloudinary.com/danrxrws8/image/upload/v1758045719/shoes_ye5ogq.jpg",
    },
    {
      "title": "Bags",
      "categoryId": "bags",
      "image":
          "https://res.cloudinary.com/danrxrws8/image/upload/v1758045365/bags_l3pgh3.jpg",
    },
    {
      "title": "Electronics",
      "categoryId": "electronics",
      "image":
          "https://res.cloudinary.com/danrxrws8/image/upload/v1758045898/electronics_ayrdw8.jpg",
    },
    {
      "title": "Beauty & Cosmetics",
      "categoryId": "beauty",
      "image":
          "https://res.cloudinary.com/danrxrws8/image/upload/v1758047242/beauty_ueyxwe.jpg",
    },
    {
      "title": "Sports & Fitness",
      "categoryId": "sports",
      "image":
          "https://res.cloudinary.com/danrxrws8/image/upload/v1758046060/sports_xt5xyz.avif",
    },
    {
      "title": "Home & Living",
      "categoryId": "home_living",
      "image":
          "https://res.cloudinary.com/danrxrws8/image/upload/v1758046959/home_fashion_q47ojm.webp",
    },
    {
      "title": "Kids & Babies",
      "categoryId": "kids_babies",
      "image":
          "https://res.cloudinary.com/danrxrws8/image/upload/v1758046879/kids-fashion_hrgudw.avif",
    },
    {
      "title": "Groceries",
      "categoryId": "groceries",
      "image":
          "https://res.cloudinary.com/danrxrws8/image/upload/v1758047062/groceries_x11zdl.jpg",
    },
  ];

  final batch = FirebaseFirestore.instance.batch();
  final categoriesRef = FirebaseFirestore.instance.collection('Categories');

  for (var category in categories) {
    final docRef = categoriesRef.doc(category["categoryId"]);
    batch.set(docRef, category);
  }

  await batch.commit();
  debugPrint("✅ Categories seeded successfully!");
}
