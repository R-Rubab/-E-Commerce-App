import 'package:ecommerce_app/common/helper/bottomsheet/app_bottomsheet.dart';
import 'package:ecommerce_app/core/configs/theme/app_colors.dart';
import 'package:ecommerce_app/domain/product/entities/product.dart';
import 'package:ecommerce_app/presentation/product_detail/bloc/product_color_selection_cubit.dart';
import 'package:ecommerce_app/presentation/product_detail/widgets/product_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectedColor extends StatelessWidget {
  final ProductEntity productEntity;
  const SelectedColor({required this.productEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppBottomSheet.display(
            context,
            BlocProvider.value(
                value: BlocProvider.of<ProductColorSelectionCubit>(context),
                child: ProductColors(
                  productEntity: productEntity,
                )));
      },
      child: Container(
        height: 60.h,
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: EColors.secondBackground,
          borderRadius: BorderRadius.circular(100.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                'Color',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Row(
              children: [
                BlocBuilder<ProductColorSelectionCubit, int>(
                    builder: (context, state) {
                  return Container(
                    height: 20.h,
                    width: 20.w,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: EColors.white),
                      color: productEntity.colors.isNotEmpty
                          ? Color.fromRGBO(
                              productEntity.colors[state].hexCode[0],
                              productEntity.colors[state].hexCode[1],
                              productEntity.colors[state].hexCode[2],
                              1)
                          : EColors.grey,
                      shape: BoxShape.circle,
                    ),
                  );
                }),
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
