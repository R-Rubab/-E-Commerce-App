import 'package:ecommerce_app/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce_app/core/configs/assets/app_vectors.dart';
import 'package:ecommerce_app/presentation/search/pages/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
       padding: EdgeInsets.symmetric(
         horizontal: 16.w
       ),
      child: TextField(
        readOnly: true,
        onTap: (){
          AppNavigator.push(context, const SearchPage());
        },
        decoration: InputDecoration(
          contentPadding:  EdgeInsets.symmetric(horizontal:12.w,vertical: 12.h),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.r)
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.r)
          ),
          prefixIcon: SvgPicture.asset(
            AppVectors.search,
            fit: BoxFit.none,
          ),
          hintText: 'search'
        ),
      ),
    );
  }
}