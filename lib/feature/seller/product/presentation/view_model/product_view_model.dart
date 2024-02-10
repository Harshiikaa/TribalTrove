import 'package:flutter_riverpod/flutter_riverpod.dart';

final batchViewModelProvider =
    StateNotifierProvider.autoDispose<ProductViewModel, BatchState>(
  (ref) => ProductViewModel(
    addBatchUsecase: ref.read(addBatchUsecaseProvider),
    getAllBatchUsecase: ref.read(getAllBatchUsecaseProvider),
  ),
);

class ProductViewModel extends StateNotifier<BatchState> {
  final AddBatchUsecase addBatchUsecase;
  final GetAllBatchUsecase getAllBatchUsecase;

  ProductViewModel({
    required this.addBatchUsecase,
    required this.getAllBatchUsecase,
  }) : super(BatchState.initialState()) {
    getAllBatch();
  }

  void addBatch(BatchEntity batch) {
    state = state.copyWith(isLoading: true);
    addBatchUsecase.addBatch(batch).then((value) {
      value.fold(
        (failure) => state = state.copyWith(isLoading: false),
        (success) {
          state = state.copyWith(isLoading: false, showMessage: true);
          getAllBatch();
        },
      );
    });
  }

  void getAllBatch() {
    state = state.copyWith(isLoading: true);
    getAllBatchUsecase.getAllBatch().then((value) {
      value.fold(
        (failure) => state = state.copyWith(isLoading: false),
        (batches) {
          state = state.copyWith(isLoading: false, batches: batches);
        },
      );
    });
  }

  void resetMessage(bool value) {
    state = state.copyWith(showMessage: value);
  }
}