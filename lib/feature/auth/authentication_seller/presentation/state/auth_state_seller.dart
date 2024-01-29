class AuthStateSeller {
  final bool isLoading;
  final String? error;
  final String? imageName;
  final bool? showMessage;

  AuthStateSeller({
    required this.isLoading,
    this.error,
    this.imageName,
    this.showMessage,
  });

  factory AuthStateSeller.initial() {
    return AuthStateSeller(
      isLoading: false,
      error: null,
      imageName: null,
      showMessage: false,
    );
  }

  AuthStateSeller copyWith({
    bool? isLoading,
    String? error,
    String? imageName,
    bool? showMessage,
  }) {
    return AuthStateSeller(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      imageName: imageName ?? this.imageName,
      showMessage: showMessage ?? this.showMessage,
    );
  }

  @override
  String toString() => 'AuthState(isLoading: $isLoading, error: $error)';
}
