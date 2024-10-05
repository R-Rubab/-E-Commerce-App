import 'package:ecommerce_app/common/bloc/categories/categories_display_cubit.dart';
import 'package:ecommerce_app/common/bloc/categories/categories_display_state.dart';
import 'package:ecommerce_app/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce_app/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce_app/core/configs/theme/app_colors.dart';
import 'package:ecommerce_app/core/configs/theme/extension.dart';
import 'package:ecommerce_app/presentation/category_products/pages/category_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/helper/images/image_display.dart';

class AllCategoriesPage extends StatelessWidget {
  const AllCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        hideBack: false,
        title: _shopByCategories(context),
      ),
      body: BlocProvider(
        create: (context) => CategoriesDisplayCubit()..displayCategories(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [_categories()],
          ),
        ),
      ),
    );
  }

  Widget _shopByCategories(BuildContext context) {
    return Text(
      'Shop by Categories',
      style: Theme.of(context).textTheme.displayMedium,
    );
  }

  Widget _categories() {
    return BlocBuilder<CategoriesDisplayCubit, CategoriesDisplayState>(
      builder: (context, state) {
        if (state is CategoriesLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is CategoriesLoaded) {
          return ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    AppNavigator.push(
                        context,
                        CategoryProductsPage(
                          categoryEntity: state.categories[index],
                        ));
                  },
                  child: Container(
                    height: 70.h,
                    padding: 12.p,
                    decoration: BoxDecoration(
                        color: EColors.secondBackground,
                        borderRadius: BorderRadius.circular(8.r)),
                    child: Row(
                      children: [
                        Container(
                          height: 50.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(ImageDisplayHelper
                                      .generateCategoryImageURL(
                                          state.categories[index].image)))),
                        ),
                        15.w.pw,
                        Text(
                          state.categories[index].title,
                          style: Theme.of(context).textTheme.bodyMedium,
                        )
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => 10.h.ph,
              itemCount: state.categories.length);
        }
        return Container();
      },
    );
  }
}
