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
            height: 1.sh,
            width: 180.w,
            decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(225, 255, 255, 255),
                  width: 6,
                ),
                color: Colors.black,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: 
                    NetworkImage(
                      ImageDisplayHelper.generateProductImageURL(
                        productEntity.images[0],
                      ),
                    ),
                    ),
                borderRadius: BorderRadius.circular(28.r)),
          ),
          Positioned(
            bottom: 0,
            // left: 20.h,
            child: Container(
              height: 150.h,
              width: 180.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28.r),
                color: Colors.white.withOpacity(.7),
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(.9),
                    Colors.white.withOpacity(.5),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productEntity.title,
                    style: GoogleFonts.gelasio(
                        fontSize: 18.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w300),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Row(
                    children: [
                      Text(
                        productEntity.discountedPrice == 0
                            ? "   ${productEntity.price}\$"
                            : "   ${productEntity.discountedPrice}\$",
                        style: GoogleFonts.gelasio(
                          fontSize: 18.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(width: 40.w),
                      Text(
                        productEntity.discountedPrice == 0
                            ? ''
                            : "  ${productEntity.price}\$",
                        style: GoogleFonts.gelasio(
                            fontSize: 18.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
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
