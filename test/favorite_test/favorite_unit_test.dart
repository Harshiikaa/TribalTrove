// import 'package:TribalTrove/core/failure/failure.dart';
// import 'package:TribalTrove/feature/seller/product/data/model/product_api_model.dart';
// import 'package:TribalTrove/feature/seller/product/domain/entity/product_entity.dart';
// import 'package:TribalTrove/feature/seller/product/domain/use_cases/create_product_usecase.dart';
// import 'package:TribalTrove/feature/user/favorites/data/model/favorite_api_model.dart';
// import 'package:TribalTrove/feature/user/favorites/domain/entity/favorite_entity.dart';
// import 'package:TribalTrove/feature/user/favorites/domain/usecases/create_favorite_usecase.dart';
// import 'package:dartz/dartz.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';

// import 'favorite_unit_test.mocks.dart';
// @GenerateNiceMocks([
//   MockSpec<CreateFavoriteUseCase>(),
// ])
// void main() {
//   late MockCreateFavoriteUseCase mockCreateFavoriteUseCase;
 
//   setUpAll(() async {
//     mockCreateFavoriteUseCase = MockCreateFavoriteUseCase();
//   });
 
//   group('test add to favorites', () {
//     setUpAll(() async {
//       // Arrange
//       final productEntity = ProductEntity(
//         productID: '1234567890',
//         productName: 'Test',
//         productPrice: 100,
//         productCategory: 'test',
//         productDescription: 'Test',
      
//       );
 
//       final favoriteModel = FavoriteAPIModel(
//        product : ProductAPIModel.fromEntity(productEntity), createdAt: '2134',
//       );
 
//       // Act
//       when(
//         mockCreateFavoriteUseCase.createFavorite(
//           productEntity as FavoriteEntity?, // Pass the productEntity directly
//         ),
//       ).thenAnswer((_) async => Right(true as String));
//     });
//   });
 
//   test('should return a Failure with error message', () async {
//     // Arrange
//     final mockErrorModel = Failure(
//       error: 'Please enter hotel details',
//     );
 
//     // Act
//     when(
//       mockCreateFavoriteUseCase.createFavorite(
//         null, // Pass the appropriate argument (null or any default value)
//       ),
//     ).thenAnswer((_) async => Left(mockErrorModel));
 
//     // Call the addToFavorite method
//     final result = await mockCreateFavoriteUseCase.createFavorite(null);
 
//     // Verify the expected result
//     expect(result, Left(mockErrorModel));
//   });
 
//   // test('should remove from favorite', () async {
//   //   // Arrange
//   //   final productModel = ProductAPIModel(productName: 'Hehe', productPrice: 200, productCategory: 'test', productDescription: 'lorem ipsum'
     
//   //   );
 
//   //   final productEntity = productModel.toEntity(); // Convert to ProductEntity
 
//   //   // Act
//   //   when(
//   //     mockCreateFavoriteUseCase.removeFromFavorite(
//   //       productEntity, // Pass ProductEntity instead of ProductModel
//   //     ),
//   //   ).thenAnswer((_) async => Right(true as List<FavoriteEntity>));
//   // });
 
//   // Your test logic goes here
// }
 