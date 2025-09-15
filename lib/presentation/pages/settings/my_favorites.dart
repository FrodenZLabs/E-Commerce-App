import 'package:e_commerce_app/presentation/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class MyFavoritesPage extends StatelessWidget {
  const MyFavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(title: Text('My Favorites')),
      // body: BlocBuilder(
      //   builder: (context, state) {
      //     if (state is ProductsLoading) {
      //       return const Center(child: CircularProgressIndicator());
      //     }
      //     if (state is ProductsLoaded) {
      //       return _products(state.products);
      //     }
      //     if (state is LoadProductsFailure) {
      //       return const Center(child: Text('Please try again'));
      //     }
      //
      //     return Container();
      //   },
      // ),
    );
  }

  Widget _products(List<String> products) {
    return Expanded(
      child: GridView.builder(
        itemCount: products.length,
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.6,
        ),
        itemBuilder: (BuildContext context, int index) {
          return;
        },
      ),
    );
  }
}
