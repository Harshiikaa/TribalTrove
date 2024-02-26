import 'dart:io';

import 'package:TribalTrove/config/routes/app_route.dart';
import 'package:TribalTrove/feature/user/authentication_user/domain/use_cases/login_usecase.dart';
import 'package:TribalTrove/feature/user/authentication_user/domain/use_cases/register_usecase.dart';
import 'package:TribalTrove/feature/user/authentication_user/domain/use_cases/upload_image_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entity/auth_entity.dart';

import '../state/auth_state.dart';

final authViewModelProvider = StateNotifierProvider<AuthViewModel, AuthState>(
  (ref) => AuthViewModel(ref.read(registerUseCaseProvider),
      ref.read(loginUseCaseProvider), ref.read(uploadImageUseCaseProvider)),
);

class AuthViewModel extends StateNotifier<AuthState> {
  final RegisterUseCase _registerUseCase;
  final LoginUseCase _loginUseCase;
  final UploadImageUseCase _uploadImageUsecase;

  AuthViewModel(
      this._registerUseCase, this._loginUseCase, this._uploadImageUsecase)
      : super(AuthState.initial());

  Future<void> registerUser(AuthEntity entity) async {
    state = state.copyWith(isLoading: true);
    final result = await _registerUseCase.registerUser(entity);
    state = state.copyWith(isLoading: false);
    result.fold(
      (failure) => state = state.copyWith(error: failure.error),
      (success) => state = state.copyWith(isLoading: false, showMessage: true),
    );
  }

  Future<void> loginUser(
      BuildContext context, String email, String password) async {
    state = state.copyWith(isLoading: true);
    final result = await _loginUseCase.loginUser(email, password);
    state = state.copyWith(isLoading: false);
    result.fold(
        (failure) => state = state.copyWith(
              error: failure.error,
              showMessage: true,
            ), (success) {
      state = state.copyWith(
        isLoading: false,
        showMessage: true,
        error: null,
      );
      Navigator.popAndPushNamed(context, AppRoute.home);
    });
  }

  Future<void> uploadImage(File? file) async {
    state = state.copyWith(isLoading: true);
    var data = await _uploadImageUsecase.uploadProfilePicture(file!);
    data.fold(
      (l) {
        state = state.copyWith(isLoading: false, error: l.error);
      },
      (imageName) {
        state = state.copyWith(
          isLoading: false,
          error: null,
          imageName: imageName,
        );
      },
    );
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
