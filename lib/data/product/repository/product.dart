import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/product/models/product.dart';
import 'package:ecommerce_app/data/product/source/product_firebase_service.dart';
import 'package:ecommerce_app/domain/product/entities/product.dart';
import 'package:ecommerce_app/domain/product/repository/product.dart';
import 'package:ecommerce_app/service_locator.dart';

class ProductRepositoryImpl extends ProductRepository {
  @override
  Future<Either> getTopSelling() async {
    var returnedData = await sl<ProductFirebaseService>().getTopSelling();
    // log("GetTopSelling repository: $returnedData");
    return returnedData.fold((error) {
      // log("Error getTopSelling repository: $error");
      return Left(error);
    }, (data) {
      // log("Data GetTopSelling repositoryImp==>: ${Right(List.from(data).map((e) => ProductModel.fromMap(e).toEntity()).toList())}");
      return Right(List.from(data)
          .map((e) => ProductModel.fromMap(e).toEntity())
          .toList());
    });
  }

  @override
  Future<Either> getNewIn() async {
    var returnedData = await sl<ProductFirebaseService>().getNewIn();
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      return Right(List.from(data)
          .map((e) => ProductModel.fromMap(e).toEntity())
          .toList());
    });
  }

  @override
  Future<Either> getProductsByCategoryId(String categoryId) async {
    var returnedData =
        await sl<ProductFirebaseService>().getProductsByCategoryId(categoryId);
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      return Right(List.from(data)
          .map((e) => ProductModel.fromMap(e).toEntity())
          .toList());
    });
  }

  @override
  Future<Either> getProductsByTitle(String title) async {
    var returnedData =
        await sl<ProductFirebaseService>().getProductsByTitle(title);
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      return Right(List.from(data)
          .map((e) => ProductModel.fromMap(e).toEntity())
          .toList());
    });
  }

  @override
  Future<Either> addOrRemoveFavoriteProduct(ProductEntity product) async {
    var returnedData =
        await sl<ProductFirebaseService>().addOrRemoveFavoriteProduct(product);
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      return Right(data);
    });
  }

  @override
  Future<bool> isFavorite(String productId) async {
    return await sl<ProductFirebaseService>().isFavorite(productId);
  }

  @override
  Future<Either> getFavoritesProducts() async {
    var returnedData =
        await sl<ProductFirebaseService>().getFavoritesProducts();
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      return Right(List.from(data)
          .map((e) => ProductModel.fromMap(e).toEntity())
          .toList());
    });
  }
}



// class ProductRepositoryImpl extends ProductRepository {
//   @override
//   Future<Either> getTopSelling() async {
//     var returnedData = await sl<ProductFirebaseService>().getTopSelling();
//     return returnedData.fold((error) {
//       return Left(error);
//     }, (data) {
//           log("Fetching get-top-selling products");
//       return Right(
//           List.from(data).map((e) => ProductModel.fromMap(e).toEntity()).toList());
//       // return Right(List.from(data ?? []).map((e) {
//       //   if (e != null) {
//       //     return ProductModel.fromMap(e).toEntity();
//       //   } else {
//       //     // Handle null case if necessary
//       //     return null;

//       //   }
//       //   // return ProductModel.fromMap(e).toEntity();
//       // }).toList());
//     });
//   }

//   @override
//   Future<Either> getNewIn() async {
//     var returnedData = await sl<ProductFirebaseService>().getNewIn();
//     return returnedData.fold((error) {
//       return Left(error);
//     }, (data) {
//       log("Fetching getNEwIn products");
//             return Right(
//           List.from(data).map((e) => ProductModel.fromMap(e).toEntity()).toList());
//       // return Right(List.from(data ?? []).map((e) {
//       //   if (e != null) {
//       //     return ProductModel.fromMap(e).toEntity();
//       //   } else {
//       //     return null;
//       //   }
//       //   // ProductModel.fromMap(e).toEntity();
//       // }).toList());
//     });
//   }

//   @override
//   Future<Either> getProductsByCategoryId(String categoryId) async {
//     var returnedData =
//         await sl<ProductFirebaseService>().getProductsByCategoryId(categoryId);
//     return returnedData.fold((error) {
//       return Left(error);
//     }, (data) {
//       log("Fetching getProductsByCategoryId products");
//             return Right(
//           List.from(data).map((e) => ProductModel.fromMap(e).toEntity()).toList());
//       // return Right(List.from(data ?? []).map((e) {
//       //   if (e != null) {
//       //     return ProductModel.fromMap(e).toEntity();
//       //   } else {
//       //     return null;
//       //   }
//       //   // ProductModel.fromMap(e).toEntity();
//       // }).toList());
//     });
//   }

//   @override
//   Future<Either> getProductsByTitle(String title) async {
//     var returnedData =
//         await sl<ProductFirebaseService>().getProductsByTitle(title);
//     return returnedData.fold((error) {
//       return Left(error);
//     }, (data) {
//       log("Fetching Title products");
//             return Right(
//           List.from(data).map((e) => ProductModel.fromMap(e).toEntity()).toList());
//       // return Right(List.from(data ?? []).map((e) {
//       //   if (e != null) {
//       //     return ProductModel.fromMap(e).toEntity();
//       //   } else {
//       //     return null;
//       //   }
//       //   // ProductModel.fromMap(e).toEntity();
//       // }).toList());
//     });
//   }

//   @override
//   Future<Either> addOrRemoveFavoriteProduct(ProductEntity product) async {
//     var returnedData =
//         await sl<ProductFirebaseService>().addOrRemoveFavoriteProduct(product);
//     return returnedData.fold((error) {
//       return Left(error);
//     }, (data) {
//       log("Fetching addorremovefavorite products");
//       return Right(data);
//     });
//   }

//   @override
//   Future<bool> isFavorite(String productId) async {
//     return await sl<ProductFirebaseService>().isFavorite(productId);
//   }

//   @override
//   Future<Either> getFavoritesProducts() async {
//     var returnedData =
//         await sl<ProductFirebaseService>().getFavoritesProducts();
//     return returnedData.fold((error) {
//       return Left(error);
//     }, (data) {
//       return Right(
//           List.from(data).map((e) => ProductModel.fromMap(e).toEntity()).toList());
//       // return Right(List.from(data ?? []).map((e) {
//       //   if (e != null) {
//       //     return ProductModel.fromMap(e).toEntity();
//       //   } else {
//       //     return null;
//       //   }
//         // ProductModel.fromMap(e).toEntity();
//       // }).toList());
//     });
//   }
// }
