import 'package:ecommerce_app/common/bloc/categories/categories_display_cubit.dart';
import 'package:ecommerce_app/common/helper/images/image_display.dart';
import 'package:ecommerce_app/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce_app/core/configs/theme/app_colors.dart';
import 'package:ecommerce_app/core/configs/theme/extension.dart';
import 'package:ecommerce_app/presentation/all_categories/pages/all_categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/bloc/categories/categories_display_state.dart';
import '../../../domain/category/entity/category.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesDisplayCubit()..displayCategories(),
      child: BlocBuilder<CategoriesDisplayCubit, CategoriesDisplayState>(
        builder: (context, state) {
          if (state is CategoriesLoading) {
            return const CircularProgressIndicator();
          }
          if (state is CategoriesLoaded) {
            return Column(
              children: [
                _seaAll(context),
                SizedBox(height: 20.h),
                _categories(state.categories)
              ],
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _seaAll(BuildContext context) {
    return Padding(
      padding:  16.w.hp,
      
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Categories',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          GestureDetector(
            onTap: () {
              AppNavigator.push(context, const AllCategoriesPage());
            },
            child: Text(
              'See All',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18.sp,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _categories(List<CategoryEntity> categories) {
    return SizedBox(
      height: 100.h,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: 16.w.hp,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  height: 60.h,
                  width: 60.w,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: EColors.white,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            ImageDisplayHelper.generateCategoryImageURL(
                                categories[index].image),
                          ))),
                ),
                10.h.ph,
                Text(
                  categories[index].title,
                  style:
                      TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp),
                )
              ],
            );
          },
          separatorBuilder: (context, index) => 15.w.pw,
          itemCount: categories.length),
    );
  }
}
