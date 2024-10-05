import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/product/entities/product.dart';

class ProductTitle extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductTitle({required this.productEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 9.h),
      child: Text(
        productEntity.title,
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }
}
