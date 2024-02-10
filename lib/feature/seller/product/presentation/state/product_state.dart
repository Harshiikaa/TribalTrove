
class ProductState {
  final bool isLoading;
  final List<BatchEntity> batches;
  final bool showMessage;

  ProductState({
    required this.isLoading,
    required this.batches,
    required this.showMessage,
  });

  factory ProductState.initialState() => ProductState(
        isLoading: false,
        batches: [],
        showMessage: false,
      );

  ProductState copyWith({
    bool? isLoading,
    List<BatchEntity>? batches,
    bool? showMessage,
  }) {
    return ProductState(
      isLoading: isLoading ?? this.isLoading,
      batches: batches ?? this.batches,
      showMessage: showMessage ?? this.showMessage,
    );
  }
}
