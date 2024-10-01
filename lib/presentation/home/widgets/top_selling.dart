import 'dart:developer';

import 'package:ecommerce_app/domain/product/usecases/get_top_selling.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/bloc/product/products_display_cubit.dart';
import '../../../common/bloc/product/products_display_state.dart';
import '../../../common/widgets/product/product_card.dart';
import '../../../domain/product/entities/product.dart';
import '../../../service_locator.dart';

class TopSelling extends StatelessWidget {
  const TopSelling({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductsDisplayCubit(useCase: sl<GetTopSellingUseCase>())
            ..displayProducts(),
      child: BlocBuilder<ProductsDisplayCubit, ProductsDisplayState>(
        builder: (context, state) {
          if (state is ProductsLoading) {
            return const CircularProgressIndicator();
          } else 
          if (state is ProductsLoaded) {
            if (state.products.isEmpty) {
              return const Text('No products available');
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _topSelling(),
                  SizedBox(height: 20.h),
                  _products(state.products),
                ],
              );
            }
          } else {
            return Container(
              child: Text('No Founded $state'),
            );
          }
        },
      ),
    );
  }

  Widget _topSelling() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Text(
        'Top Selling',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
      ),
    );
  }

  Widget _products(List<ProductEntity> products) {
    return SizedBox(
      height: 300.h,
      child: ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ProductCard(
              productEntity: products[index],
            );
          },
          separatorBuilder: (context, index) => SizedBox(width: 10.w),
          itemCount: products.length),
    );
  }
}



// class TopSelling extends StatelessWidget {
//   const TopSelling({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) =>
//           ProductsDisplayCubit(useCase: sl<GetTopSellingUseCase>())
//             ..displayProducts(),
//       child: BlocBuilder<ProductsDisplayCubit, ProductsDisplayState>(
//         builder: (context, state) {
//           if (state is ProductsLoading) {
//             return const CircularProgressIndicator();
//           } else if (state is ProductsLoaded) {
//             if (state.products.isEmpty) {
//               return const Text('No products available');
//             }
//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 _topSelling(),
//                 SizedBox(height: 20.h),
//                 _products(state.products)
//               ],
//             );
//           } else if (state is LoadProductsFailure) {
//             return const Text('Failed to load products');
//           }
//           return Container(
//             child: Text('Noo Found Data $state'),
//           );
//           // else {
//           //   return Container(
//           //     child: Text('No Found Data $state'),
//           //   );
//           // }
//         },
//       ),
//     );
//   }

//   Widget _topSelling() {
//     return Padding(
//       padding: EdgeInsets.symmetric(
//         horizontal: 16.w,
//       ),
//       child: Text(
//         'Top Selling',
//         style: GoogleFonts.gelasio(
//             fontWeight: FontWeight.bold, fontSize: 20.sp, letterSpacing: .9),
//       ),
//     );
//   }

//   Widget _products(List<ProductEntity> products) {
//     print('Number of products: ${products.length}');
//     log('Number of products: ${products.length}');
//     return Container(
//       color: Colors.blue,
//       height: 300.h,
//       child: ListView.separated(
//           shrinkWrap: true,
//           padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
//           scrollDirection: Axis.horizontal,
//           itemBuilder: (context, index) {
//             return ProductCard(
//               productEntity: products[index],
//             );
//           },
//           separatorBuilder: (context, index) => SizedBox(width: 10.w),
//           itemCount: products.length),
//     );
//   }
// }
