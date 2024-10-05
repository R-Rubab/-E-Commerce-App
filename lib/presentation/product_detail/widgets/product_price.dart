import 'package:ecommerce_app/core/configs/theme/app_colors.dart';
import 'package:ecommerce_app/core/configs/theme/extension.dart';
import 'package:ecommerce_app/domain/product/entities/product.dart';
import 'package:flutter/material.dart';

class ProductPrice extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductPrice({required this.productEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 20.hp,
      child: Text(
        "Rs.\t  \$${productEntity.discountedPrice != 0 ? productEntity.discountedPrice.toString() : productEntity.price.toString()}",
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(color: EColors.primary),
      ),
    );
  }
}
