import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/usecase/usecase.dart';
import 'products_display_state.dart';

class ProductsDisplayCubit extends Cubit<ProductsDisplayState> {
  final UseCase useCase;
  ProductsDisplayCubit({required this.useCase}) : super(ProductsInitialState());

  void displayProducts({dynamic params}) async {
    emit(ProductsLoading());
    var returnedData = await useCase.call(params: params);
    returnedData.fold((error) {
      emit(LoadProductsFailure());
      log("Error loading displayProducts: ${LoadProductsFailure()}  | $error");
    }, (data) {
      emit(ProductsLoaded(products: data));
      log("Data loading displayProducts: $data");
    });
  }

  void displayInitial() {
    emit(ProductsInitialState());
    log("**** Data loading displayInitial");
  }
}

// class ProductsDisplayCubit extends Cubit<ProductsDisplayState> {
//   final UseCase useCase;
//   ProductsDisplayCubit({required this.useCase}) : super(ProductsInitialState());
//   Future<void> displayProducts({dynamic params}) async {
//     try {
//       emit(ProductsLoading());
//       var returnedData = await useCase.call(params: params);

//       returnedData.fold((error) {
//         emit(LoadProductsFailure());
//         log("Error loading products: $error");
//       }, (data) {
//         // Check if the data is indeed a List or Map
//         if (data is List<ProductEntity>) {
//           emit(ProductsLoaded(
//               products: data)); // Assuming data is a List<ProductModel>
//           log("Data loading displayProducts: $data");
//         } else if (data is Map<String, dynamic>) {
//           // Handle single product case if needed
//           emit(ProductsLoaded(
//               products: [ProductModel.fromMap(data).toEntity()]));
//           log("Single product loaded: $data");
//         } else {
//           emit(LoadProductsFailure());
//           log("Unexpected data type: ${data.runtimeType}");
//         }
//       });
//     } catch (e) {
//       emit(LoadProductsFailure());
//       log("Error loading displayProducts: $e");
//     }
//   }

//   // Future<void> displayProducts({dynamic params}) async {
//   //   // var returnedData = await useCase.call(params: params);

//   //   // returnedData.fold((error) {
//   //   //   emit(LoadProductsFailure());
//   //   // }, (data) {
//   //   //   log("Data before map: $data"); // Log the data before using map
//   //   //   if (data == null) {
//   //   //     log("Data is null, cannot proceed with map");
//   //   //     emit(LoadProductsFailure()); // Emit failure if data is null
//   //   //     return; // Early return to prevent further errors
//   //   //   }
//   //   //   emit(ProductsLoaded(products: data));
//   //   //   log("Data loading displayProducts: $data");
//   //   // });

//   //   try{
//   //   emit(ProductsLoading());
//   //   var returnedData = await useCase.call(params: params);

//   //   returnedData.fold((error) {
//   //     emit(LoadProductsFailure());
//   //   }, (data) {
//   //     emit(ProductsLoaded(products: data));
//   //   log("Returned Data: $returnedData"); // Log the returned data
//   //           log("Data loading displayProducts: $data");
//   //   });
//   //   }catch(e){
//   //           // print("Error loading products: $e");
//   //     emit(LoadProductsFailure());
//   //           log("Error loading displayProducts0: ${e}");
//   //   }
//   // }

//   void displayInitial() {
//     emit(ProductsInitialState());
//   }
// }
