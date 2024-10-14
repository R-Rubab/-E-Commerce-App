import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../domain/product/entities/product.dart';
import '../models/product.dart';

abstract class ProductFirebaseService {
  Future<Either> getTopSelling();
  Future<Either> getNewIn();
  Future<Either> getProductsByCategoryId(String categoryId);
  Future<Either> getProductsByTitle(String title);
  Future<Either> addOrRemoveFavoriteProduct(ProductEntity product);
  Future<bool> isFavorite(String productId);
  Future<Either> getFavoritesProducts();
}

class ProductFirebaseServiceImpl extends ProductFirebaseService {
  @override
  Future<Either> getTopSelling() async {
    try {
      var returnedData = await FirebaseFirestore.instance
          .collection('Products')
          .where('salesNumber', isGreaterThanOrEqualTo: 20)
          .get();
      // log('ProductFirebaseSErvice : $returnedData \n result ProductFirebaseSErvice: ${Right(returnedData.docs.map((e) => e.data()).toList())}');
      return Right(returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      // log('ProductFirebaseService: $e ${const Left('Please try again')}');
      return const Left('Please try again');
    }
  }

  @override
  Future<Either> getNewIn() async {
    try {
      var returnedData = await FirebaseFirestore.instance
          .collection('Products')
          .where('createdDate', isGreaterThanOrEqualTo: DateTime(2024, 07, 25))
          .get();
      return Right(returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left('Please try again');
    }
  }

  @override
  Future<Either> getProductsByCategoryId(String categoryId) async {
    try {
      var returnedData = await FirebaseFirestore.instance
          .collection('Products')
          .where('categoryId', isEqualTo: categoryId)
          .get();
      return Right(returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left('Please try again');
    }
  }

  @override
  Future<Either> getProductsByTitle(String title) async {
    try {
      var returnedData = await FirebaseFirestore.instance
          .collection('Products')
          .where(
            'title',
            isGreaterThanOrEqualTo: title,
          )
          .get();
      return Right(returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left('Please try again');
    }
  }

  @override
  Future<Either> addOrRemoveFavoriteProduct(ProductEntity product) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      var products = await FirebaseFirestore.instance
          .collection("Users")
          .doc(user!.uid)
          .collection('Favorites')
          .where('productId', isEqualTo: product.productId)
          .get();

      if (products.docs.isNotEmpty) {
        await products.docs.first.reference.delete();
        return const Right(false);
      } else {
        await FirebaseFirestore.instance
            .collection("Users")
            .doc(user.uid)
            .collection('Favorites')
            .add(product.fromEntity().toMap());
        return const Right(true);
      }
    } catch (e) {
      return const Left('Please try again');
    }
  }

  @override
  Future<bool> isFavorite(String productId) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      var products = await FirebaseFirestore.instance
          .collection("Users")
          .doc(user!.uid)
          .collection('Favorites')
          .where('productId', isEqualTo: productId)
          .get();

      if (products.docs.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  @override
  Future<Either> getFavoritesProducts() async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      var returnedData = await FirebaseFirestore.instance
          .collection("Users")
          .doc(user!.uid)
          .collection('Favorites')
          .get();
      return Right(returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left('Please try again');
    }
  }
}






// abstract class ProductFirebaseService {
//   Future<Either> getTopSelling();
//   Future<Either> getNewIn();
//   Future<Either> getProductsByCategoryId(String categoryId);
//   Future<Either> getProductsByTitle(String title);
//   Future<Either> addOrRemoveFavoriteProduct(ProductEntity product);
//   Future<bool> isFavorite(String productId);
//   Future<Either> getFavoritesProducts();
// }

// class ProductFirebaseServiceImpl extends ProductFirebaseService {
//   @override
//   Future<Either> getTopSelling() async {
//     try {
//       var returnedData = await FirebaseFirestore.instance
//           .collection('Products')
//           // .where('salesNumber', isGreaterThanOrEqualTo: 55)
//           .get();
//       if (returnedData.docs.isEmpty) {
//         log("No documents found");
//         return const Right([]); // Return an empty list if no documents found
//       } else {
//         final products = returnedData.docs.map((doc) {
//           final data = doc.data();

//           // Check if data is a Map<String, dynamic>
//           log("Returned Data (Map): $data");
//           return ProductModel.fromMap(data);
//         }).toList();

//         log("Fetched ${products.length} top-selling products");
//         return Right(products);
//       }
//       // else{

//       //   final products = returnedData.docs.map((doc) {
//       //     final data = doc.data();

//       // log("Returned Top-selling Data:${returnedData.docs.length} documents found ${returnedData.docs.map((e) => e.data()).toList()} documents found");
//       //     return ProductModel.fromMap(data);
//       //   }).toList();
//       //   return Right(products);
//       // // return Right(returnedData.docs.map((e) => e.data()).toList());
//       // }
//     } catch (e) {
//       log("Error fetching top-selling products: $e");
//       return const Left('Please try again');
//     }
//   }

//   @override
//   Future<Either> getNewIn() async {
//     try {
//       var returnedData = await FirebaseFirestore.instance
//           .collection('Products')
//           // .where('createdDate', isGreaterThanOrEqualTo: DateTime(2024, 09, 12))
//           .get();
//       if (returnedData.docs.isEmpty) {
//         log("No documents found");
//         return const Right([]); // Return an empty list if no documents found
//       } else {
//         log("Fetching getNewIn products");
//         return Right(returnedData.docs.map((e) => e.data()).toList());
//       }
//     } catch (e) {
//       log("Error fetching getNewIn products: $e");
//       return const Left('Please try again');
//     }
//   }

//   @override
//   Future<Either> getProductsByCategoryId(String categoryId) async {
//     try {
//       log("Fetching getProductsByCategoryId products");
//       var returnedData = await FirebaseFirestore.instance
//           .collection('Products')
//           // .where('categoryId', isEqualTo: categoryId)
//           .get();
//       if (returnedData.docs.isEmpty) {
//         return const Right([]); // Return an empty list if no documents found
//       }
//       return Right(returnedData.docs.map((e) => e.data()).toList());
//     } catch (e) {
//       log("Error fetching getProductsByCategoryId products: $e");
//       return const Left('Please try again');
//     }
//   }

//   @override
//   Future<Either> getProductsByTitle(String title) async {
//     try {
//       log("Fetching getProductsByTitle products");
//       var returnedData = await FirebaseFirestore.instance
//           .collection('Products')
//           // .where(
//           // 'title',
//           // isGreaterThanOrEqualTo: title,
//           // )
//           .get();
//       if (returnedData.docs.isEmpty) {
//         return const Right([]); // Return an empty list if no documents found
//       }
//       return Right(returnedData.docs.map((e) => e.data()).toList());
//     } catch (e) {
//       log("Error fetching getProductsByTitle products: $e");
//       return const Left('Please try again');
//     }
//   }

//   @override
//   Future<Either> addOrRemoveFavoriteProduct(ProductEntity product) async {
//     try {
//       log("Fetching addOrRemoveFavoriteProduct products");
//       var user = FirebaseAuth.instance.currentUser;
//       var products = await FirebaseFirestore.instance
//           .collection("Users")
//           .doc(user!.uid)
//           .collection('Favorites')
//           // .where('productId', isEqualTo: product.productId)
//           .get();

//       if (products.docs.isNotEmpty) {
//         await products.docs.first.reference.delete();
//         return const Right(false);
//       } else {
//         await FirebaseFirestore.instance
//             .collection("Users")
//             .doc(user.uid)
//             .collection('Favorites')
//             .add(product.fromEntity().toMap());
//         return const Right(true);
//       }
//     } catch (e) {
//       log("Error fetching addOrRemoveFavoriteProduct products: $e");
//       return const Left('Please try again');
//     }
//   }

//   @override
//   Future<bool> isFavorite(String productId) async {
//     try {
//       var user = FirebaseAuth.instance.currentUser;
//       var products = await FirebaseFirestore.instance
//           .collection("Users")
//           .doc(user!.uid)
//           .collection('Favorites')
//           // .where('productId', isEqualTo: productId)
//           .get();

//       if (products.docs.isNotEmpty) {
//         return true;
//       } else {
//         return false;
//       }
//     } catch (e) {
//       return false;
//     }
//   }

//   @override
//   Future<Either> getFavoritesProducts() async {
//     try {
//       var user = FirebaseAuth.instance.currentUser;
//       var returnedData = await FirebaseFirestore.instance
//           .collection("Users")
//           .doc(user!.uid)
//           .collection('Favorites')
//           .get();
//       return Right(returnedData.docs.map((e) => e.data()).toList());
//     } catch (e) {
//       return const Left('Please try again');
//     }
//   }
// }
