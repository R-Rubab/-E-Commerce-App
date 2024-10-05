import 'package:ecommerce_app/core/configs/theme/app_colors.dart';
import 'package:ecommerce_app/domain/product/entities/product.dart';
import 'package:ecommerce_app/presentation/product_detail/bloc/product_quantity_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductQuantity extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductQuantity({required this.productEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      padding: EdgeInsets.only(left: 12.w),
      decoration: BoxDecoration(
        color: EColors.secondBackground,
        borderRadius: BorderRadius.circular(100.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Quantity',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    context.read<ProductQuantityCubit>().decrement();
                  },
                  icon: Container(
                    height: 40.h,
                    width: 40.w,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: EColors.primary),
                    child: const Center(
                      child: Icon(
                        Icons.remove,
                        size: 30,
                      ),
                    ),
                  )),
              SizedBox(width: 10.w),
              BlocBuilder<ProductQuantityCubit, int>(
                builder: (context, state) => Text(
                  state.toString(),
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
                ),
              ),
              SizedBox(width: 10.w),
              IconButton(
                  onPressed: () {
                    context.read<ProductQuantityCubit>().increment();
                  },
                  icon: Container(
                    height: 40.h,
                    width: 40.w,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: EColors.primary),
                    child: const Center(
                      child: Icon(
                        Icons.add,
                        size: 30,
                      ),
                    ),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
