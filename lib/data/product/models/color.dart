// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer';

import '/domain/product/entities/color.dart';

class ProductColorModel {
  final String title;
  final List<int> hexCode;

  ProductColorModel({
    required this.title,
    required this.hexCode,
  });

  // Convert the model to a map
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'hexCode': hexCode,
    };
  }

  // Create an instance of ProductColorModel from a map
  factory ProductColorModel.fromMap(Map<String, dynamic> map) {
    log('Map Map: $map');

    return ProductColorModel(
      title: map['title'] != null
          ? map['title'] as String
          : '', // Handle null case for title
      hexCode: _parseHexCode(map['hexCode']), // Handle hexCode conversion
    );
  }

static List<int> _parseHexCode(dynamic hexCode) {
    if (hexCode is List) {
      return List<int>.from(hexCode);
    } else if (hexCode is String) {
      // Ensure the hexCode has exactly 6 characters and only contains valid hex digits
      final validHex = RegExp(r'^[0-9a-fA-F]{6}$');

      if (validHex.hasMatch(hexCode)) {
        return [
          int.parse(hexCode.substring(0, 2), radix: 16),
          int.parse(hexCode.substring(2, 4), radix: 16),
          int.parse(hexCode.substring(4, 6), radix: 16),
        ];
      } else {
        // If it's not a valid hex string, return an empty list or handle appropriately
        log('Invalid hex code: $hexCode');
        return [];
      }
    } else {
      return []; // Return an empty list if hexCode is neither a List nor a String
    }
  }

  
}
extension ProductColorXModel on ProductColorModel {
  ProductColorEntity toEntity() {
    return ProductColorEntity(title: title, hexCode: hexCode);
  }
}

extension ProductColorXEntity on ProductColorEntity {
  ProductColorModel fromEntity() {
    return ProductColorModel(title: title, hexCode: hexCode);
  }}

// class ProductColorModel {
//   final String title;
//   final List<int> hexCode;

//   ProductColorModel({
//     required this.title,
//     required this.hexCode,
//   });

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'title': title,
//       'hexCode': hexCode,
//     };
//   }

//   factory ProductColorModel.fromMap(Map<String, dynamic> map) {
//      log('Map Map: $map');

//     return ProductColorModel(
//       title: map['title'] != null
//           ? map['title'] as String
//           : '', // Handle null case for title
//       hexCode: map['hexCode'] != null
//           ? List<int>.from(map['hexCode']) // Ensure hexCode is a List<int>
//           : [], // Default to an empty list if hexCode is null
//     );
//   }
// }

// extension ProductColorXModel on ProductColorModel {
//   ProductColorEntity toEntity() {
//     return ProductColorEntity(title: title, hexCode: hexCode);
//   }
// }

// extension ProductColorXEntity on ProductColorEntity {
//   ProductColorModel fromEntity() {
//     return ProductColorModel(title: title, hexCode: hexCode);
//   }
// }

// --------------------------------old one

// class ProductColorModel {

//   final String title;
//   final List<int> rgb;

//   ProductColorModel({
//     required this.title,
//     required this.rgb,
//   });

  

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'title': title,
//       'rgb': rgb,
//     };
//   }

//   factory ProductColorModel.fromMap(Map<String, dynamic> map) {
//     //     if (map == null) {
//     //   return ProductColorModel(title: 'Unknown',rgb: []); // Default value
//     // }
//     return ProductColorModel(
//       title: map['title'] as String,
//       rgb: List < int > .from(
//         map['rgb'].map((e) => e),
//       ),
//     );
//   }

// }

// extension ProductColorXModel on ProductColorModel {
//   ProductColorEntity toEntity() {
//     return ProductColorEntity(
//       title: title,
//       rgb: rgb
//     );
//   }
// }

// extension ProductColorXEntity on ProductColorEntity {
//   ProductColorModel fromEntity() {
//     return ProductColorModel(
//       title: title,
//       rgb: rgb
//     );
//   }
// }
