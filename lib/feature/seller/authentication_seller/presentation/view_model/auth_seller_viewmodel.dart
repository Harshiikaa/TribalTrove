import 'package:TribalTrove/config/routes/app_route.dart';
import 'package:TribalTrove/feature/seller/authentication_seller/domain/entity/auth_entity_seller.dart';
import 'package:TribalTrove/feature/seller/authentication_seller/domain/use_cases/login_usecase_seller.dart';
import 'package:TribalTrove/feature/seller/authentication_seller/domain/use_cases/register_usecase_seller.dart';
import 'package:TribalTrove/feature/seller/authentication_seller/presentation/state/auth_state_seller.dart';
import 'package:TribalTrove/feature/user/authentication_user/domain/use_cases/login_usecase.dart';
import 'package:TribalTrove/feature/user/authentication_user/domain/use_cases/register_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authViewModelSellerProvider =
    StateNotifierProvider<AuthSellerViewModel, AuthStateSeller>(
  (ref) => AuthSellerViewModel(ref.read(registerUseCaseSellerProvider),
      ref.read(loginUseCaseSellerProvider)),
);

class AuthSellerViewModel extends StateNotifier<AuthStateSeller> {
  final RegisterUseCaseSeller _registerUseCaseSeller;
  final LoginUseCaseSeller _loginUseCaseSeller;

  AuthSellerViewModel(this._registerUseCaseSeller, this._loginUseCaseSeller)
      : super(AuthStateSeller.initial());

  Future<void> registerSeller(AuthEntitySeller entity) async {
    state = state.copyWith(isLoading: true);
    final result = await _registerUseCaseSeller.registerSeller(entity);
    state = state.copyWith(isLoading: false);
    result.fold(
      (failure) => state = state.copyWith(error: failure.error),
      (success) => state = state.copyWith(isLoading: false, showMessage: true),
    );
  }

  Future<void> loginSeller(
      BuildContext context, String email, String password) async {
    state = state.copyWith(isLoading: true);
    final result = await _loginUseCaseSeller.loginSeller(email, password);
    state = state.copyWith(isLoading: false);
    result.fold(
      (failure) => state = state.copyWith(
        error: failure.error,
        showMessage: true,
      ),
      (success) => state = state.copyWith(
        isLoading: false,
        showMessage: true,
        error: null,
      ),
    );
    Navigator.popAndPushNamed(context, AppRoute.sellerDashboardRoute);
  }

  void reset() {
    state = state.copyWith(
      isLoading: false,
      error: null,
      imageName: null,
      showMessage: false,
    );
  }

  void resetMessage() {
    state = state.copyWith(
        showMessage: false, imageName: null, error: null, isLoading: false);
  }
}
