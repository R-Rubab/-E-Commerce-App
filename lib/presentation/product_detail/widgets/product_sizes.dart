import 'package:ecommerce_app/core/configs/theme/app_colors.dart';
import 'package:ecommerce_app/domain/product/entities/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/product_size_selection_cubit.dart';

class ProductSizes extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductSizes({
    required this.productEntity,
    super.key
   });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      padding: EdgeInsets.symmetric(horizontal:16.w,vertical: 16.h),
      decoration:  BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16.r),
          topLeft: Radius.circular(16.r)
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 40.h,
            child: Stack(
              children: [
                 Center(
                    child: Text(
                      'Size',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22.sp
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close)
                    ),
                  )
              ],
            ),
          ),
           SizedBox(height: 20.h),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return BlocBuilder<ProductSizeSelectionCubit,int>(
                  builder: (context, state) => GestureDetector(
                    onTap: (){
                      context.read<ProductSizeSelectionCubit>().itemSelection(index);
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 60.h,
                      padding: EdgeInsets.symmetric(horizontal:16.w,vertical: 16.h),
                      decoration: BoxDecoration(
                        color: state == index ? AppColors.primary :
                          AppColors.secondBackground,
                        borderRadius: BorderRadius.circular(50)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              productEntity.sizes[index],
                              style:  TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp
                              ),
                            ),
                            state == index ?
                            const Icon(
                              Icons.check,
                              size: 30,
                            ): Container(
                              width: 30.w,
                            )
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) =>  SizedBox(height:20.h),
              itemCount: productEntity.sizes.length
            ),
          ),
        ],
      ) ,
    );
  }
}