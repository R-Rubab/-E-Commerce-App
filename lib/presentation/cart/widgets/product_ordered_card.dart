import 'package:ecommerce_app/common/helper/images/image_display.dart';
import 'package:ecommerce_app/core/configs/theme/extension.dart';
import 'package:ecommerce_app/domain/order/entities/product_ordered.dart';
import 'package:ecommerce_app/presentation/cart/bloc/cart_products_display_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/configs/theme/app_colors.dart';

class ProductOrderedCard extends StatelessWidget {
  final ProductOrderedEntity productOrderedEntity;
  const ProductOrderedCard({required this.productOrderedEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      padding: 8.w.phv(8.h),
      decoration: BoxDecoration(
          color: EColors.secondBackground,
          borderRadius: BorderRadius.circular(15.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    width: 90.w,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                ImageDisplayHelper.generateProductImageURL(
                                    productOrderedEntity.productImage))),
                        borderRadius: BorderRadius.circular(15.r)),
                  ),
                ),
                10.w.pw,
                Expanded(
                  flex: 6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productOrderedEntity.productTitle,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18.sp,
                        ),
                      ),
                      Row(
                        children: [
                          Text.rich(
                              overflow: TextOverflow.ellipsis,
                              TextSpan(
                                  text: 'Size - ',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: productOrderedEntity.productSize,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.sp,
                                      ),
                                    )
                                  ])),
                          10.w.pw,
                          Text.rich(
                              overflow: TextOverflow.ellipsis,
                              TextSpan(
                                  text: 'Color - ',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: productOrderedEntity.productColor,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.sp,
                                      ),
                                    )
                                  ])),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '\$${productOrderedEntity.totalPrice}',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context
                        .read<CartProductsDisplayCubit>()
                        .removeProduct(productOrderedEntity);
                  },
                  child: CircleAvatar(
                    radius: 15.r,
                    backgroundColor: EColors.primary,
                    child: Icon(
                      Icons.remove,
                      size: 20.w,
                      color: EColors.white,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
