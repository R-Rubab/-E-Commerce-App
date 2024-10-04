import 'package:ecommerce_app/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce_app/core/configs/theme/extension.dart';
import 'package:ecommerce_app/presentation/cart/bloc/cart_products_display_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/configs/assets/app_vectors.dart';
import '../../../domain/order/entities/product_ordered.dart';
import '../bloc/cart_products_display_state.dart';
import '../widgets/checkout.dart';
import '../widgets/product_ordered_card.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(
        title: Text('Cart'),
      ),
      body: BlocProvider(
        create: (context) => CartProductsDisplayCubit()..displayCartProducts(),
        child: BlocBuilder<CartProductsDisplayCubit, CartProductsDisplayState>(
          builder: (context, state) {
            if (state is CartProductsLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is CartProductsLoaded) {
              return state.products.isEmpty
                  ? Center(child: _cartIsEmpty())
                  : Stack(
                      children: [
                        _products(state.products),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Checkout(
                              products: state.products,
                            ))
                      ],
                    );
            }
            if (state is LoadCartProductsFailure) {
              return Center(
                child: Text(state.errorMessage),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _products(List<ProductOrderedEntity> products) {
    return ListView.separated(
        padding: 16.w.phv(16.h),
        itemBuilder: (context, index) {
          return ProductOrderedCard(
            productOrderedEntity: products[index],
          );
        },
        separatorBuilder: (context, index) => 10.h.ph,
        itemCount: products.length);
  }

  Widget _cartIsEmpty() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(AppVectors.cartBag),
        20.h.ph,
        Text(
          "Cart is empty",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25.sp),
        )
      ],
    );
  }
}
