
// import 'package:TribalTrove/config/constants/hive_table_constant.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// final productHiveModelProvider = Provider(
//   (ref) => ProductHiveModel.empty(),
// );



// class ProductHiveModel {
//   @HiveField(0)
//   final String productID;

//   @HiveField(1)
//   final String productName;

  
//   @HiveField(2)
//   final String productPrice;
   
//   @HiveField(3)
//   final String productCategory;

   
//   @HiveField(4)
//   final String productDescription;

//     @HiveField(5)
//   final String productImageURL;

//   // empty constructor
//   ProductHiveModel.empty() : this(productID: '', productName: '',productPrice: '',productCategory: '',productDescription: '',productImageURL: '');

//   ProductHiveModel({
//     String? productID,

//     required this.batchName,
//   }) : batchId = batchId ?? const Uuid().v4();

//   // Convert Hive Object to Entity
//   BatchEntity toEntity() => BatchEntity(
//         batchId: batchId,
//         batchName: batchName,
//       );

//   // Convert Entity to Hive Object
//   BatchHiveModel toHiveModel(BatchEntity entity) => BatchHiveModel.ProductHiveModel(
//         // batchId: entity.batchId,
//         batchName: entity.batchName,
//       );

//   // Convert Hive List to Entity List
//   List<BatchEntity> toEntityList(List<BatchHiveModel> models) =>
//       models.map((model) => model.toEntity()).toList();

//   @override
//   String toString() {
//     return 'batchId: $batchId, batchName: $batchName';
//   }
// }
