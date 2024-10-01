import 'package:ecommerce_app/common/bloc/product/products_display_cubit.dart';
import 'package:ecommerce_app/core/configs/assets/app_vectors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchField extends StatelessWidget {
  SearchField({super.key});

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(
        horizontal: 8.w
      ),
      child: TextField(
        controller: textEditingController,
        onChanged: (value){
          if (value.isEmpty) {
            context.read<ProductsDisplayCubit>().displayInitial();
          } else {
            context.read<ProductsDisplayCubit>().displayProducts(params: value);
          }
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal:12.w,vertical: 12.h),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.r)
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.r)
          ),
          prefixIcon:  SvgPicture.asset(
              AppVectors.search,
              fit: BoxFit.none,
          ),
          hintText: 'search'
        ),
      ),
    );
  }
}