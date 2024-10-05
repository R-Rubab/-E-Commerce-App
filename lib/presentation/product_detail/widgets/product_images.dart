import 'package:ecommerce_app/common/helper/images/image_display.dart';
import 'package:ecommerce_app/core/configs/theme/app_colors.dart';
import 'package:ecommerce_app/domain/product/entities/product.dart';
import 'package:ecommerce_app/presentation/navigation_bar/nav_bar.dart';
import 'package:ecommerce_app/presentation/product_detail/widgets/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductImages extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductImages({required this.productEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: EColors.secondBackground,
          height: 450.h,
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  width: 400.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              ImageDisplayHelper.generateProductImageURL(
                                  productEntity.images[index])))),
                );
              },
              separatorBuilder: (context, index) => SizedBox(width: 10.w),
              itemCount: productEntity.images.length),
        ),
        Positioned(
          top: 40.h,
          left: 20.w,
          child: IconButton(
            onPressed: () {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              } else {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NavigationPage()),
                );
              }
            },
            icon: Container(
              height: 50.h,
              width: 50.w,
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 76, 96, 81),
                  offset: Offset(4, 4),
                  blurRadius: 15,
                ),
                BoxShadow(
                  color: Color.fromARGB(255, 71, 91, 74),
                  offset: Offset(-4, -4),
                  blurRadius: 10,
                ),
              ], color: EColors.secondBackground, shape: BoxShape.circle),
              child: Icon(Icons.arrow_back_ios_new,
                  size: 15.w, color: Colors.white),
            ),
          ),
        ),
        Positioned(
          top: 40.h,
          right: 20.w,
          child: FavoriteButton(
            productEntity: productEntity,
          ),
        ),
      ],
    );
  }
}
