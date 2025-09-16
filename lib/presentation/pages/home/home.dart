import 'package:e_commerce_app/presentation/widgets/categories.dart';
import 'package:e_commerce_app/presentation/widgets/header.dart';
import 'package:e_commerce_app/presentation/widgets/new_in.dart';
import 'package:e_commerce_app/presentation/widgets/search_field.dart';
import 'package:e_commerce_app/presentation/widgets/top_selling.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(),
            SizedBox(height: 24),
            SearchField(),
            SizedBox(height: 24),
            Categories(),
            SizedBox(height: 24),
            TopSelling(),
            SizedBox(height: 24),
            NewIn(),
          ],
        ),
      ),
    );
  }
}
