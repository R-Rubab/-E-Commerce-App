// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/domain/product/entities/product.dart';

import 'color.dart';




class ProductModel {
  final String categoryId;
  final List<ProductColorModel> colors;
  final Timestamp createdDate;
  final num discountedPrice;
  final int gender;
  final List<String> images;
  final num price;
  final List<String> sizes;
  final String productId;
  final int salesNumber;
  final String title;

  ProductModel(
      {required this.categoryId,
      required this.colors,
      required this.createdDate,
      required this.discountedPrice,
      required this.gender,
      required this.images,
      required this.price,
      required this.sizes,
      required this.productId,
      required this.salesNumber,
      required this.title});

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    log('Map Map MAp: $map \n ProductModel: ${ProductModel(
      categoryId: map['categoryId'] as String,
      colors: List<ProductColorModel>.from(
          map['colors'].map((e) => ProductColorModel.fromMap(e))),
      createdDate: map['createdDate'] as Timestamp,
      discountedPrice: map['discountedPrice'] as num,
      gender: map['gender'] as int,
      images: List<String>.from(
        map['images'].map((e) => e.toString()),
      ),
      price: map['price'] as num,
      sizes: List<String>.from(
        map['sizes'].map((e) => e.toString()),
      ),
      productId: map['productId'] as String,
      salesNumber: map['salesNumber'] as int,
      title: map['title'] as String,
    )}');
    return ProductModel(
      categoryId: map['categoryId'] as String,
      colors: map['colors'] != null
          ? (map['colors'] is List
              ? List<ProductColorModel>.from(
                  map['colors'].map((e) => ProductColorModel.fromMap(e)))
              : [
                  ProductColorModel.fromMap({'color': map['colors']})
                ]) // Handle single string case
          : [],
      createdDate: map['createdDate'] as Timestamp,
      discountedPrice: map['discountedPrice'] as num,
      gender: map['gender'] as int,
      images: map['images'] != null
          ? List<String>.from(
              map['images'].map((e) => e.toString()),
            )
          : [],
      price: map['price'] as num,
      sizes: map['sizes'] != null
          ? List<String>.from(
              map['sizes'].map((e) => e.toString()),
            )
          : [],
      productId: map['productId'] as String,
      salesNumber: map['salesNumber'] as int,
      title: map['title'] as String,
    );
    // ProductModel(
    //   categoryId: map['categoryId'] as String,
    //   colors: map['colors'] != null
    //     ? List<ProductColorModel>.from(
    //       map['colors'].map((e) => ProductColorModel.fromMap(e))):[],
    //   createdDate: map['createdDate'] as Timestamp,
    //   discountedPrice: map['discountedPrice'] as num,
    //   gender: map['gender'] as int,
    //   images: map['images'] != null
    //     ?  List<String>.from(
    //     map['images'].map((e) => e.toString()),
    //   ):[],
    //   price: map['price'] as num,
    //   sizes: map['sizes'] != null
    //       ?  List<String>.from(
    //     map['sizes'].map((e) => e.toString()),
    //   ):[],
    //   productId: map['productId'] as String,
    //   salesNumber: map['salesNumber'] as int,
    //   title: map['title'] as String,
    // );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'categoryId': categoryId,
      'colors': colors.map((e) => e.toMap()).toList(),
      'createdDate': createdDate,
      'discountedPrice': discountedPrice,
      'gender': gender,
      'images': images.map((e) => e.toString()).toList(),
      'price': price,
      'sizes': sizes.map((e) => e.toString()).toList(),
      'productId': productId,
      'salesNumber': salesNumber,
      'title': title,
    };
  }
}

extension ProductXModel on ProductModel {
  ProductEntity toEntity() {
    return ProductEntity(
        categoryId: categoryId,
        colors: colors.map((e) => e.toEntity()).toList(),
        createdDate: createdDate,
        discountedPrice: discountedPrice,
        gender: gender,
        images: images,
        price: price,
        sizes: sizes,
        productId: productId,
        salesNumber: salesNumber,
        title: title);
  }
}

extension ProductXEntity on ProductEntity {
  ProductModel fromEntity() {
    return ProductModel(
        categoryId: categoryId,
        colors: colors.map((e) => e.fromEntity()).toList(),
        createdDate: createdDate,
        discountedPrice: discountedPrice,
        gender: gender,
        images: images,
        price: price,
        sizes: sizes,
        productId: productId,
        salesNumber: salesNumber ,
        title: title);
  }
}


// class ProductModel {
//   final String categoryId;
//   final List<ProductColorModel> colors;
//   final Timestamp createdDate;
//   final num discountedPrice;
//   final num gender;
//   final List<String> images;
//   final num price;
//   final List<String> sizes;
//   final String productId;
//   final num salesNumber;
//   final String title;

//   ProductModel(
//       {required this.categoryId,
//       required this.colors,
//       required this.createdDate,
//       required this.discountedPrice,
//       required this.gender,
//       required this.images,
//       required this.price,
//       required this.sizes,
//       required this.productId,
//       required this.salesNumber,
//       required this.title});

//   factory ProductModel.fromMap(Map<String, dynamic> map) {
//     log('Creating ProductModel from map: $map');

//     if (map is String) {
//       throw Exception('Expected a Map but got a String.'); // Handle string case
//     }
//     // if (map == null) {
//     //   return ProductModel(
//     //       categoryId: '',
//     //       colors: [],
//     //       createdDate: Timestamp.now(),
//     //       discountedPrice: 0,
//     //       gender: 0,
//     //       images: [],
//     //       price: 0,
//     //       sizes: [],
//     //       productId: '',
//     //       salesNumber: 0,
//     //       title: ''); // Return null if map is null
//     // }
//     log('Model: ${List.from(map.keys).map((e) => ProductModel.fromMap(e).toEntity()).toList()}');
//     return ProductModel(
//       categoryId: map['categoryId'] as String,
//       colors: List<ProductColorModel>.from(
//           (map['colors'] as List).map((e) => ProductColorModel.fromMap(e))),
//       createdDate: map['createdDate'] as Timestamp,
//       discountedPrice: map['discountedPrice'] as num,
//       gender: map['gender'] as num,
//       images: List<String>.from(map['images'].map((e) => e.toString())),
//       price: map['price'] as num,
//       sizes: List<String>.from(map['sizes'].map((e) => e.toString())),
//       productId: map['productId'] as String,
//       salesNumber: map['salesNumber'] as num,
//       title: map['title'] as String,
//     );
//   }

// // factory ProductModel.fromMap(Map<String, dynamic>? map) {

// //     return ProductModel(
// //       categoryId: map?['categoryId'] as String? ?? 'unknown',
// //       colors: map?['colors'] != null
// //           ? List<ProductColorModel>.from(
// //               (map?['colors'] as List).map((e) => ProductColorModel.fromMap(e)))
// //           : [], // Provide a default empty list if null
// //       createdDate: map?['createdDate'] as Timestamp? ?? Timestamp.now(),
// //       discountedPrice: map?['discountedPrice'] as num? ?? 0,
// //       gender: map?['gender'] as int? ?? 0,
// //       images: map?['images'] != null
// //           ? List<String>.from(map?['images'].map((e) => e.toString()))
// //           : [], // Provide a default empty list if null
// //       price: map?['price'] as num? ?? 0,
// //       sizes: map?['sizes'] != null
// //           ? List<String>.from(map?['sizes'].map((e) => e.toString()))
// //           : [], // Provide a default empty list if null
// //       productId: map?['productId'] as String? ?? 'unknown',
// //       salesNumber: map?['salesNumber'] as int? ?? 0,
// //       title: map?['title'] as String? ?? 'unknown',
// //     );
// //   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'categoryId': categoryId,
//       'colors': colors.map((e) => e.toMap()).toList(),
//       'createdDate': createdDate,
//       'discountedPrice': discountedPrice,
//       'gender': gender,
//       'images': images.map((e) => e.toString()).toList(),
//       'price': price,
//       'sizes': sizes.map((e) => e.toString()).toList(),
//       'productId': productId,
//       'salesNumber': salesNumber,
//       'title': title,
//     };
//   }
// }

// extension ProductXModel on ProductModel {
//   ProductEntity toEntity() {
//     return ProductEntity(
//         categoryId: categoryId,
//         colors: colors.map((e) => e.toEntity()).toList(),
//         createdDate: createdDate,
//         discountedPrice: discountedPrice,
//         gender: gender,
//         images: images,
//         price: price,
//         sizes: sizes,
//         productId: productId,
//         salesNumber: salesNumber,
//         title: title);
//   }
// }

// extension ProductXEntity on ProductEntity {
//   ProductModel fromEntity() {
//     return ProductModel(
//         categoryId: categoryId,
//         colors: colors.map((e) => e.fromEntity()).toList(),
//         createdDate: createdDate,
//         discountedPrice: discountedPrice,
//         gender: gender,
//         images: images,
//         price: price,
//         sizes: sizes,
//         productId: productId,
//         salesNumber: salesNumber,
//         title: title);
//   }
// }
