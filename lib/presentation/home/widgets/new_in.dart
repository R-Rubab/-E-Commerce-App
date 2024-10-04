import 'package:ecommerce_app/core/configs/theme/app_colors.dart';
import 'package:ecommerce_app/core/configs/theme/extension.dart';
import 'package:ecommerce_app/domain/product/usecases/get_new_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/bloc/product/products_display_cubit.dart';
import '../../../common/bloc/product/products_display_state.dart';
import '../../../common/widgets/product/product_card.dart';
import '../../../domain/product/entities/product.dart';
import '../../../service_locator.dart';

class NewIn extends StatelessWidget {
  const NewIn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsDisplayCubit(useCase: sl<GetNewInUseCase>())
        ..displayProducts(),
      child: BlocBuilder<ProductsDisplayCubit, ProductsDisplayState>(
        builder: (context, state) {
          if (state is ProductsLoading) {
            return const CircularProgressIndicator();
          }
          if (state is ProductsLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _newIn(context),
                SizedBox(height: 20.h),
                _products(state.products)
              ],
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _newIn(BuildContext context) {
    return Text(
      'New Products',
      style: Theme.of(context)
          .textTheme
          .displayMedium!
          .copyWith(color: EColors.primary),
    ).padded(16.hp.w);
  }

  Widget _products(List<ProductEntity> products) {
    return SizedBox(
      height: 220.h,
      width: 1.sw,
      child: ListView.separated(
          shrinkWrap: true,
          padding: 16.w.hp,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ProductCard(
              productEntity: products.reversed.toList()[index],
            );
          },
          separatorBuilder: (context, index) => 13.w.pw,
          itemCount: products.length),
    );
  }
}
