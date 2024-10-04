import 'package:ecommerce_app/core/configs/theme/extension.dart';
import 'package:ecommerce_app/core/export_file.dart/export.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          } else if (state is ProductsLoaded) {
            if (state.products.isEmpty) {
              return const Text('No products available');
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _topSelling(context),
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

  Widget _topSelling(BuildContext context) {
    return Text(
      'Top Selling',
      style: Theme.of(context).textTheme.displayMedium,
    ).padded(16.hp.w);
  }

  Widget _products(List<ProductEntity> products) {
    return SizedBox(
      // color: Colors.amber,
      height: 210.h,
      width: 1.sw,
      child: ListView.separated(
          shrinkWrap: true,
          padding: 16.w.hp,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ProductCard(
              productEntity: products[index],
            );
          },
          separatorBuilder: (context, index) => 13.w.pw,
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
