
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widget/puopular_clothes.dart';
import '../providers/FavoriteProvider.dart';
import '../providers/favorite_provider.dart';

class Favorite_Screen extends StatelessWidget {
  const Favorite_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteProducts =
        context.watch<FavoriteProvider>().favoriteProducts;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Scaffold(
          body: favoriteProducts.isEmpty
              ? const Center(
            child: Text(
              "No favorite products yet",
              style: TextStyle(fontSize: 20),
            ),
)
              : GridView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: favoriteProducts.length,
            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              mainAxisExtent: 250,
            ),
            itemBuilder: (context, index) {
              return puopularclothes(
                id: favoriteProducts[index],
              );
            },
          ),
        ),
      ),
    );
  }
}
