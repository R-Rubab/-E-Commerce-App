import 'package:ecommerce_app/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce_app/core/configs/theme/extension.dart';
import 'package:ecommerce_app/domain/product/usecases/get_favorties_products.dart';
import 'package:ecommerce_app/presentation/navigation_bar/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/bloc/product/products_display_cubit.dart';
import '../../../common/bloc/product/products_display_state.dart';
import '../../../common/widgets/product/product_card.dart';
import '../../../domain/product/entities/product.dart';
import '../../../service_locator.dart';

class MyFavoritesPage extends StatelessWidget {
  const MyFavoritesPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: const Text('My Favorites'),
        onTap: () {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const NavigationPage()),
            );
          }
        },
      ),
      body: BlocProvider(
          create: (context) =>
              ProductsDisplayCubit(useCase: sl<GetFavoriteProductsUseCase>())
                ..displayProducts(),
          child: BlocBuilder<ProductsDisplayCubit, ProductsDisplayState>(
            builder: (context, state) {
              if (state is ProductsLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is ProductsLoaded) {
                return _products(state.products);
              }

              if (state is LoadProductsFailure) {
                return const Center(
                  child: Text('Please try again'),
                );
              }

              return Container();
            },
          )),
    );
  }

  Widget _products(List<ProductEntity> products) {
    return GridView.builder(
      itemCount: products.length,
      padding: 16.p,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.8),
      itemBuilder: (BuildContext context, int index) {
        return ProductCard(productEntity: products[index]);
      },
    );
  }
}
