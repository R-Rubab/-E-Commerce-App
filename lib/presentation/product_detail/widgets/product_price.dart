import 'package:ecommerce_app/core/configs/theme/app_colors.dart';
import 'package:ecommerce_app/domain/product/entities/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductPrice extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductPrice({
    required this.productEntity,
    super.key
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal:16.w,vertical: 16.h),
      child: Text(
        "\$${productEntity.discountedPrice != 0 ?
        productEntity.discountedPrice.toString() : 
        productEntity.price.toString()}",
        style:  TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.primary,
          fontSize: 14.sp,
        ),
      ),
    );
  }
}