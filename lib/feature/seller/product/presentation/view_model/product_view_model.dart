import 'package:TribalTrove/feature/seller/product/domain/entity/product_entity.dart';
import 'package:TribalTrove/feature/seller/product/domain/use_cases/create_product_usecase.dart';
import 'package:TribalTrove/feature/seller/product/domain/use_cases/get_all_products_usecase.dart';
import 'package:TribalTrove/feature/seller/product/presentation/state/product_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productViewModelProvider =
    StateNotifierProvider.autoDispose<ProductViewModel, ProductState>(
  (ref) => ProductViewModel(
    createProductUsecase: ref.read(createProductUsecaseProvider),
    getAllProductsUsecase: ref.read(getAllProductsUsecaseProvider),
  ),
);

class ProductViewModel extends StateNotifier<ProductState> {
  final CreateProductUsecase createProductUsecase;
  final GetAllProductsUsecase getAllProductsUsecase;

  ProductViewModel({
    required this.createProductUsecase,
    required this.getAllProductsUsecase,
  }) : super(ProductState.initialState()) {
    getAllProducts();
  }

  void createProduct(ProductEntity product) {
    state = state.copyWith(isLoading: true);
    createProductUsecase.createProduct(product).then((value) {
      value.fold(
        (failure) => state = state.copyWith(isLoading: false),
        (success) {
          state = state.copyWith(isLoading: false, showMessage: true);
          getAllProducts();
        },
      );
    });
  }

  void getAllProducts() {
    state = state.copyWith(isLoading: true);
    getAllProductsUsecase.getAllProducts().then((value) {
      value.fold(
        (failure) => state = state.copyWith(isLoading: false),
        (products) {
          state = state.copyWith(isLoading: false, products: products);
        },
      );
    });
  }

  void resetMessage(bool value) {
    state = state.copyWith(showMessage: value);
  }
}