import 'package:ecommerce_app/common/bloc/button/button_state_cubit.dart';
import 'package:ecommerce_app/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce_app/domain/product/entities/product.dart';
import 'package:ecommerce_app/presentation/product_detail/bloc/favorite_icon_cubit.dart';
import 'package:ecommerce_app/presentation/product_detail/bloc/product_color_selection_cubit.dart';
import 'package:ecommerce_app/presentation/product_detail/bloc/product_quantity_cubit.dart';
import 'package:ecommerce_app/presentation/product_detail/bloc/product_size_selection_cubit.dart';
import 'package:ecommerce_app/presentation/product_detail/widgets/add_to_bag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/favorite_button.dart';
import '../widgets/product_images.dart';
import '../widgets/product_price.dart';
import '../widgets/product_quantity.dart';
import '../widgets/product_title.dart';
import '../widgets/selected_color.dart';
import '../widgets/selected_size.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductDetailPage({required this.productEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProductQuantityCubit()),
        BlocProvider(create: (context) => ProductColorSelectionCubit()),
        BlocProvider(create: (context) => ProductSizeSelectionCubit()),
        BlocProvider(create: (context) => ButtonStateCubit()),
        BlocProvider(
            create: (context) =>
                FavoriteIconCubit()..isFavorite(productEntity.productId))
      ],
      child: Scaffold(
        appBar: BasicAppBar(
          hideBack: false,
          action: FavoriteButton(
            productEntity: productEntity,
          ),
        ),
        bottomNavigationBar: AddToBag(
          productEntity: productEntity,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductImages(
                productEntity: productEntity,
              ),
               SizedBox(
                height: 10.h,
              ),
              ProductTitle(
                productEntity: productEntity,
              ),
              SizedBox(
                height: 10.h,
              ),
              ProductPrice(
                productEntity: productEntity,
              ),
              SizedBox(
                height: 20.h,
              ),
              SelectedSize(
                productEntity: productEntity,
              ),
              SizedBox(
                height: 15.h,
              ),
              SelectedColor(
                productEntity: productEntity,
              ),
              SizedBox(
                height: 15.h,
              ),
              ProductQuantity(
                productEntity: productEntity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
