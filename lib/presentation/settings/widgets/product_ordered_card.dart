import 'package:ecommerce_app/common/helper/images/image_display.dart';
import 'package:ecommerce_app/domain/order/entities/product_ordered.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/configs/theme/app_colors.dart';

class OrderItemCard extends StatelessWidget {
  final ProductOrderedEntity productOrderedEntity;
  const OrderItemCard({
    required this.productOrderedEntity,
    super.key
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      padding: EdgeInsets.symmetric(horizontal:8.w,vertical: 8.h),
        decoration: BoxDecoration(
          color: AppColors.secondBackground,
          borderRadius: BorderRadius.circular(8.r)
        ),
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
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            ImageDisplayHelper.generateProductImageURL(
                              productOrderedEntity.productImage
                            )
                          )
                        ),
                        borderRadius: BorderRadius.circular(4.r)
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                    Expanded(
                      flex: 6,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productOrderedEntity.productTitle,
                            overflow: TextOverflow.ellipsis,
                            style:  TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp
                            ),
                          ),
                          Row(
                            children: [
                              Text.rich(
                                overflow: TextOverflow.ellipsis,
                                TextSpan(
                                  text: 'Size - ',
                                  style:  TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10.sp
                                  ),
                                  children: [
                                    TextSpan(
                                      text: productOrderedEntity.productSize,
                                      style:  TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10.sp
                                      ),
                                    )
                                  ]
                                )
                              ),
                               SizedBox(width: 10.w ),
                              Text.rich(
                                overflow: TextOverflow.ellipsis,
                                TextSpan(
                                  text: 'Color - ',
                                  style:  TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10.sp
                                  ),
                                  children: [
                                    TextSpan(
                                      text: productOrderedEntity.productColor,
                                      style:  TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10.sp
                                      ),
                                    )
                                  ]
                                )
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                ],
              ),
            ),
            Text(
                '\$${productOrderedEntity.totalPrice}',
                style:  TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp
                ),
              )
          ],
        ),
    );
  }
}