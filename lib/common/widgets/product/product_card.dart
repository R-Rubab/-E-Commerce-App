import 'package:ecommerce_app/core/configs/theme/app_colors.dart';
import 'package:ecommerce_app/core/configs/theme/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '/common/helper/navigator/app_navigator.dart';
import '/domain/product/entities/product.dart';
import '/presentation/product_detail/pages/product_detail.dart';
import '../../helper/images/image_display.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductCard({required this.productEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.push(
            context,
            ProductDetailPage(
              productEntity: productEntity,
            ));
      },
      child: Stack(
        // crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            // height: 1.h,
            width: 180.w,
            decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xE0FFFFFF),
                  width: 3,
                ),
                color: Colors.black,
                image: productEntity
                        .images.isNotEmpty // Check if images list is not empty
                    ? DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          ImageDisplayHelper.generateProductImageURL(
                            productEntity.images[0],
                          ),
                        ),
                      )
                    : null, // If images are empty, provide a fallback (optional)
                borderRadius: BorderRadius.circular(25.r)),
          ),
          Positioned(
            bottom: 0,
            // left: 20.h,
            child: Container(
              // height: 100.h,
              width: 180.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28.r),
                color: Colors.white.withOpacity(.75),
                // gradient: LinearGradient(
                //   colors: [
                //     Colors.white10.withOpacity(.9),
                //     Colors.white.withOpacity(.5),
                //   ],
                //   begin: Alignment.topCenter,
                //   end: Alignment.bottomCenter,
                // ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  13.h.ph,
                  Text(
                    productEntity.title,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        overflow: TextOverflow.ellipsis,
                        color: EColors.black,
                        fontWeight: FontWeight.bold),
                    maxLines: 1,
                  ).padded(10.w.hp),
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productEntity.discountedPrice == 0
                            ? "Rs.  ${productEntity.price}\$"
                            : "Rs.  ${productEntity.discountedPrice}\$",
                        style: GoogleFonts.gelasio(
                          fontSize: 20.sp,
                          color: Colors.pink,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      40.w.pw,
                      Text(
                        productEntity.discountedPrice == 0
                            ? ''
                            : "Rs.  ${productEntity.price}\$",
                        style: GoogleFonts.gelasio(
                            fontSize: 16.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            decorationColor: EColors.black,
                            decoration: TextDecoration.lineThrough),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
