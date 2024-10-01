import 'package:ecommerce_app/core/configs/theme/app_colors.dart';
import 'package:ecommerce_app/domain/product/entities/product.dart';
import 'package:ecommerce_app/presentation/product_detail/widgets/product_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/helper/bottomsheet/app_bottomsheet.dart';
import '../bloc/product_size_selection_cubit.dart';

class SelectedSize extends StatelessWidget {
  final ProductEntity productEntity;
  const SelectedSize({required this.productEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppBottomSheet.display(
            context,
            BlocProvider.value(
                value: BlocProvider.of<ProductSizeSelectionCubit>(context),
                child: ProductSizes(
                  productEntity: productEntity,
                )));
      },
      child: Container(
        height: 60.h,
        margin:  EdgeInsets.symmetric(horizontal:16.w,vertical: 16.h),
        padding: EdgeInsets.symmetric(horizontal:12.w,vertical: 12.h),
        decoration: BoxDecoration(
          color: AppColors.secondBackground,
          borderRadius: BorderRadius.circular(100.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Text(
              'Size',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp),
            ),
            Row(
              children: [
                BlocBuilder<ProductSizeSelectionCubit, int>(
                  builder: (context, state) => Text(
                    productEntity.sizes[state],
                    style:  TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18.sp),
                  ),
                ),
                 SizedBox(
                  width: 15.w,
                ),
                const Icon(
                  Icons.keyboard_arrow_down,
                  size: 30,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
