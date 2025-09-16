import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future<void> seedProducts() async {
  final products = [
    {
      "categoryId": "mens_fashion",
      "colors": [
        {
          "title": "Black",
          "rgb": [0, 0, 0],
        },
        {
          "title": "Grey",
          "rgb": [128, 128, 128],
        },
      ],
      "createdDate": Timestamp.now(),
      "discountedPrice": 1800,
      "gender": 0,
      "images": [
        "https://res.cloudinary.com/danrxrws8/image/upload/v1758048528/mens_shirt_i9ff4d.webp",
        "https://res.cloudinary.com/danrxrws8/image/upload/v1758048531/mens_shirt09_u5ysej.jpg",
      ],
      "price": 2200,
      "sizes": ["M", "L", "XL"],
      "productId": "mens_shirt_001",
      "salesNumber": 45,
      "title": "Men's Formal Shirt",
    },
    {
      "categoryId": "mens_fashion",
      "colors": [
        {
          "title": "Blue",
          "rgb": [0, 0, 255],
        },
      ],
      "createdDate": Timestamp.now(),
      "discountedPrice": 2500,
      "gender": 0,
      "images": [
        "https://res.cloudinary.com/danrxrws8/image/upload/v1758048432/slim_jeans_men09_vlkdwu.webp",
        "https://res.cloudinary.com/danrxrws8/image/upload/v1758048353/slim_jeans_men_zaobne.webp",
      ],
      "price": 3000,
      "sizes": ["32", "34", "36"],
      "productId": "mens_jeans_002",
      "salesNumber": 72,
      "title": "Men's Slim Fit Jeans",
    },
    {
      "categoryId": "womens_fashion",
      "colors": [
        {
          "title": "Red",
          "rgb": [255, 0, 0],
        },
      ],
      "createdDate": Timestamp.now(),
      "discountedPrice": 3200,
      "gender": 1,
      "images": [
        "https://res.cloudinary.com/danrxrws8/image/upload/v1758049791/red_dress1_buorxi.webp",
        "https://res.cloudinary.com/danrxrws8/image/upload/v1758049804/red_dress_zayvzf.webp",
      ],
      "price": 4000,
      "sizes": ["S", "M", "L"],
      "productId": "womens_dress_001",
      "salesNumber": 50,
      "title": "Elegant Red Dress",
    },
    {
      "categoryId": "womens_fashion",
      "colors": [
        {
          "title": "Pink",
          "rgb": [255, 192, 203],
        },
      ],
      "createdDate": Timestamp.now(),
      "discountedPrice": 1500,
      "gender": 1,
      "images": [
        "https://res.cloudinary.com/danrxrws8/image/upload/v1758049790/pink_blouse_cdst9k.avif",
        "https://res.cloudinary.com/danrxrws8/image/upload/v1758049791/pink_blouse1_aiiizp.avif",
      ],
      "price": 2000,
      "sizes": ["M", "L"],
      "productId": "womens_blouse_002",
      "salesNumber": 38,
      "title": "Chiffon Pink Blouse",
    },
    {
      "categoryId": "shoes",
      "colors": [
        {
          "title": "White",
          "rgb": [255, 255, 255],
        },
        {
          "title": "Black",
          "rgb": [0, 0, 0],
        },
      ],
      "createdDate": Timestamp.now(),
      "discountedPrice": 5000,
      "gender": 2,
      "images": [
        "https://res.cloudinary.com/danrxrws8/image/upload/v1758050293/snickers_jz8c9k.webp",
        "https://res.cloudinary.com/danrxrws8/image/upload/v1758050298/snickers1_pwpsc0.webp",
      ],
      "price": 6500,
      "sizes": ["40", "41", "42", "43"],
      "productId": "shoes_sneakers_001",
      "salesNumber": 90,
      "title": "Unisex White Sneakers",
    },
    {
      "categoryId": "shoes",
      "colors": [
        {
          "title": "Brown",
          "rgb": [139, 69, 19],
        },
      ],
      "createdDate": Timestamp.now(),
      "discountedPrice": 4200,
      "gender": 0,
      "images": [
        "https://res.cloudinary.com/danrxrws8/image/upload/v1758050278/boots_n6hjqy.jpghttps://example.com/images/men_boots_brown.png",
        "https://res.cloudinary.com/danrxrws8/image/upload/v1758050288/boots1_dx9yr1.avif",
      ],
      "price": 5000,
      "sizes": ["42", "43", "44"],
      "productId": "shoes_boots_002",
      "salesNumber": 27,
      "title": "Men's Brown Leather Boots",
    },
    {
      "categoryId": "bags",
      "colors": [
        {
          "title": "Black",
          "rgb": [0, 0, 0],
        },
      ],
      "createdDate": Timestamp.now(),
      "discountedPrice": 2800,
      "gender": 2,
      "images": [
        "https://res.cloudinary.com/danrxrws8/image/upload/v1758050289/classic_bag_hbrnsh.jpg",
        "https://res.cloudinary.com/danrxrws8/image/upload/v1758050292/classic_bag1_sgszah.webp",
      ],
      "price": 3500,
      "sizes": [],
      "productId": "bag_handbag_001",
      "salesNumber": 65,
      "title": "Classic Black Handbag",
    },
    {
      "categoryId": "bags",
      "colors": [
        {
          "title": "Grey",
          "rgb": [169, 169, 169],
        },
      ],
      "createdDate": Timestamp.now(),
      "discountedPrice": 2200,
      "gender": 0,
      "images": [
        "https://res.cloudinary.com/danrxrws8/image/upload/v1758050277/backpack1_umom2j.jpg",
        "https://res.cloudinary.com/danrxrws8/image/upload/v1758050277/backpack_mvhbyb.jpg",
      ],
      "price": 2800,
      "sizes": [],
      "productId": "bag_backpack_002",
      "salesNumber": 44,
      "title": "Waterproof Grey Backpack",
    },
    {
      "categoryId": "electronics",
      "colors": [
        {
          "title": "Black",
          "rgb": [0, 0, 0],
        },
      ],
      "createdDate": Timestamp.now(),
      "discountedPrice": 12000,
      "gender": 2,
      "images": [
        "https://res.cloudinary.com/danrxrws8/image/upload/v1758051154/headphones_qcbgfw.jpg",
        "https://res.cloudinary.com/danrxrws8/image/upload/v1758051161/headphones1_zebyo4.webp",
      ],
      "price": 15000,
      "sizes": [],
      "productId": "elec_headphones_001",
      "salesNumber": 110,
      "title": "Wireless Noise Cancelling Headphones",
    },
    {
      "categoryId": "electronics",
      "colors": [
        {
          "title": "Silver",
          "rgb": [192, 192, 192],
        },
      ],
      "createdDate": Timestamp.now(),
      "discountedPrice": 45000,
      "gender": 2,
      "images": [
        "hhttps://res.cloudinary.com/danrxrws8/image/upload/v1758051172/laptop1_mphs0e.jpg",
        "https://res.cloudinary.com/danrxrws8/image/upload/v1758051166/laptop_edfhvt.jpg",
      ],
      "price": 55000,
      "sizes": [],
      "productId": "elec_laptop_002",
      "salesNumber": 23,
      "title": "13-inch Silver Laptop",
    },
    {
      "categoryId": "beauty",
      "colors": [
        {
          "title": "Pink",
          "rgb": [255, 192, 203],
        },
      ],
      "createdDate": Timestamp.now(),
      "discountedPrice": 700,
      "gender": 1,
      "images": [
        "https://res.cloudinary.com/danrxrws8/image/upload/v1758051203/lipstick_oct9aq.jpg",
        "https://res.cloudinary.com/danrxrws8/image/upload/v1758051205/lipstick1_bxriw4.webp",
      ],
      "price": 1000,
      "sizes": [],
      "productId": "beauty_lipstick_001",
      "salesNumber": 200,
      "title": "Matte Pink Lipstick",
    },
    {
      "categoryId": "beauty",
      "colors": [
        {
          "title": "Transparent",
          "rgb": [255, 255, 255],
        },
      ],
      "createdDate": Timestamp.now(),
      "discountedPrice": 1200,
      "gender": 1,
      "images": [
        "https://res.cloudinary.com/danrxrws8/image/upload/v1758051235/spray1_uu92ch.webp",
        "https://res.cloudinary.com/danrxrws8/image/upload/v1758051205/spray_cxfvu0.webp",
      ],
      "price": 1800,
      "sizes": [],
      "productId": "beauty_perfume_002",
      "salesNumber": 95,
      "title": "Floral Perfume Spray",
    },
    {
      "categoryId": "sports",
      "colors": [
        {
          "title": "White",
          "rgb": [255, 255, 255],
        },
      ],
      "createdDate": Timestamp.now(),
      "discountedPrice": 3500,
      "gender": 2,
      "images": [
        "https://res.cloudinary.com/danrxrws8/image/upload/v1758051152/football1_w9wi7i.jpg",
        "https://res.cloudinary.com/danrxrws8/image/upload/v1758051151/football_qejb3n.jpg",
      ],
      "price": 4500,
      "sizes": [],
      "productId": "sports_football_001",
      "salesNumber": 130,
      "title": "Official Match Football",
    },
    {
      "categoryId": "sports",
      "colors": [
        {
          "title": "Blue",
          "rgb": [0, 0, 255],
        },
      ],
      "createdDate": Timestamp.now(),
      "discountedPrice": 2000,
      "gender": 2,
      "images": [
        "https://res.cloudinary.com/danrxrws8/image/upload/v1758051241/yoga_mat_yfwavb.jpg",
        "https://res.cloudinary.com/danrxrws8/image/upload/v1758051242/yoga-mat-2_yqzlaa.webp",
      ],
      "price": 2500,
      "sizes": [],
      "productId": "sports_yogamat_002",
      "salesNumber": 78,
      "title": "Non-slip Blue Yoga Mat",
    },
    {
      "categoryId": "home_living",
      "colors": [
        {
          "title": "Brown",
          "rgb": [165, 42, 42],
        },
      ],
      "createdDate": Timestamp.now(),
      "discountedPrice": 8000,
      "gender": 2,
      "images": [
        "https://res.cloudinary.com/danrxrws8/image/upload/v1758052093/sofa_ogch9r.webp",
        "https://res.cloudinary.com/danrxrws8/image/upload/v1758052093/sofa1_oyndl6.webp",
      ],
      "price": 12000,
      "sizes": [],
      "productId": "home_sofa_001",
      "salesNumber": 10,
      "title": "3-Seater Brown Sofa",
    },
    {
      "categoryId": "home_living",
      "colors": [
        {
          "title": "White",
          "rgb": [255, 255, 255],
        },
      ],
      "createdDate": Timestamp.now(),
      "discountedPrice": 2500,
      "gender": 2,
      "images": [
        "https://res.cloudinary.com/danrxrws8/image/upload/v1758052087/lamp1_dviul5.jpg",
        "https://res.cloudinary.com/danrxrws8/image/upload/v1758052086/lamp_ir4dhy.jpg",
      ],
      "price": 3500,
      "sizes": [],
      "productId": "home_lamp_002",
      "salesNumber": 47,
      "title": "Modern White Table Lamp",
    },
    {
      "categoryId": "kids_babies",
      "colors": [
        {
          "title": "Yellow",
          "rgb": [255, 255, 0],
        },
      ],
      "createdDate": Timestamp.now(),
      "discountedPrice": 1500,
      "gender": 2,
      "images": [
        "https://res.cloudinary.com/danrxrws8/image/upload/v1758052094/teddy_bear_sjaubf.webp",
        "https://res.cloudinary.com/danrxrws8/image/upload/v1758052100/teddy_bear1_hq7vdw.jpg",
      ],
      "price": 2000,
      "sizes": [],
      "productId": "kids_toy_001",
      "salesNumber": 140,
      "title": "Yellow Teddy Bear",
    },
    {
      "categoryId": "kids_babies",
      "colors": [
        {
          "title": "Blue",
          "rgb": [0, 0, 255],
        },
      ],
      "createdDate": Timestamp.now(),
      "discountedPrice": 1800,
      "gender": 2,
      "images": [
        "https://res.cloudinary.com/danrxrws8/image/upload/v1758052085/kids_romper1_vrbzka.jpg",
        "https://res.cloudinary.com/danrxrws8/image/upload/v1758052079/kids_romper_gb4sfr.jpg",
      ],
      "price": 2500,
      "sizes": ["0-3M", "3-6M", "6-12M"],
      "productId": "kids_clothes_002",
      "salesNumber": 64,
      "title": "Blue Baby Romper",
    },
    {
      "categoryId": "groceries",
      "colors": [
        {
          "title": "Green",
          "rgb": [0, 255, 0],
        },
      ],
      "createdDate": Timestamp.now(),
      "discountedPrice": 200,
      "gender": 2,
      "images": [
        "https://res.cloudinary.com/danrxrws8/image/upload/v1758051984/apples1_yuqdh1.webp",
        "https://res.cloudinary.com/danrxrws8/image/upload/v1758051983/apples_c7fi70.jpg",
      ],
      "price": 300,
      "sizes": [],
      "productId": "grocery_apples_001",
      "salesNumber": 220,
      "title": "Fresh Green Apples (1kg)",
    },
    {
      "categoryId": "groceries",
      "colors": [
        {
          "title": "Brown",
          "rgb": [139, 69, 19],
        },
      ],
      "createdDate": Timestamp.now(),
      "discountedPrice": 450,
      "gender": 2,
      "images": [
        "https://res.cloudinary.com/danrxrws8/image/upload/v1758052077/basmati_nbjkyj.webp",
        "https://res.cloudinary.com/danrxrws8/image/upload/v1758052078/basmati1_zd5oiz.jpg",
      ],
      "price": 600,
      "sizes": [],
      "productId": "grocery_rice_002",
      "salesNumber": 180,
      "title": "Basmati Rice (5kg)",
    },
  ];

  final batch = FirebaseFirestore.instance.batch();
  final productsRef = FirebaseFirestore.instance.collection('Products');

  for (var product in products) {
    final docRef = productsRef.doc(product["productId"] as String?);
    batch.set(docRef, product);
  }

  await batch.commit();
  debugPrint("✅ Products seeded successfully!");
}
