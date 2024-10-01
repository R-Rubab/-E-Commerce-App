import 'package:ecommerce_app/common/helper/images/image_display.dart';
import 'package:ecommerce_app/domain/product/entities/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductImages extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductImages({
    required this.productEntity,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      child: ListView.separated(
        padding:  EdgeInsets.symmetric(horizontal:16.w,vertical: 16.h),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width: 200.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                  ImageDisplayHelper.generateProductImageURL(productEntity.images[index])
                )
              )
            ),
          );
        }, 
        separatorBuilder: (context,index) => SizedBox(width: 10.w),
        itemCount: productEntity.images.length
      ),
    );
  }
}