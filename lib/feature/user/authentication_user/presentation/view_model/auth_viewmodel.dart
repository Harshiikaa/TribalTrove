import 'dart:io';

import 'package:TribalTrove/config/routes/app_route.dart';
import 'package:TribalTrove/core/common/snackbar/snackbar.dart';
import 'package:TribalTrove/core/failure/failure.dart';
import 'package:TribalTrove/core/shared_pref/user_shared_prefs.dart';
import 'package:TribalTrove/feature/user/authentication_user/domain/use_cases/forget_password_usecase.dart';
import 'package:TribalTrove/feature/user/authentication_user/domain/use_cases/login_usecase.dart';
import 'package:TribalTrove/feature/user/authentication_user/domain/use_cases/register_usecase.dart';
import 'package:TribalTrove/feature/user/authentication_user/domain/use_cases/update_password_usecase.dart';
import 'package:TribalTrove/feature/user/authentication_user/domain/use_cases/update_profile_usecase.dart';
import 'package:TribalTrove/feature/user/authentication_user/domain/use_cases/upload_image_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entity/auth_entity.dart';

import '../state/auth_state.dart';

final authViewModelProvider = StateNotifierProvider<AuthViewModel, AuthState>(
  (ref) => AuthViewModel(
      ref.read(registerUseCaseProvider),
      ref.read(loginUseCaseProvider),
      ref.read(uploadImageUseCaseProvider),
        ref.read(userSharedPrefsProvider),
        ref.read(updatePasswordUseCaseProvider),
        ref.read(updateProfileUseCaseProvider),
        ref.read(forgetUseCaseProvider),
        ),
);

class AuthViewModel extends StateNotifier<AuthState> {
  final RegisterUseCase _registerUseCase;
  final LoginUseCase _loginUseCase;
  final UploadImageUseCase _uploadImageUsecase;
  final UserSharedPrefs _userSharedPrefs;
  final UpdatePasswordUseCase _passwordUseCase;
  final UpdateProfileUseCase _updateProfileUsecase;
  final ForgetPasswordUseCase _forgotPasswordUseCase;

  AuthViewModel(
      this._registerUseCase,
      this._loginUseCase,
      this._uploadImageUsecase,
      this._userSharedPrefs,
      this._passwordUseCase,
      this._updateProfileUsecase,
      this._forgotPasswordUseCase)
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

  Future<void> forgetPassword(BuildContext context, String email) async {
    try {
      state = state.copyWith(isLoading: true);

      var result = await _forgotPasswordUseCase.forgetPassword(email);

      result.fold(
        (failure) {
          state = state.copyWith(
            error: failure.error,
            isLoading: false,
            showMessage: true,
          );
          showSnackBar(
            message: state.error!,
            context: context,
            color: Colors.red[900],
          );
        },
        (success) {
          state = state.copyWith(
            isLoading: false,
            showMessage: true,
            error: null,
          );
          showSnackBar(
            message: state.message!,
            context: context,
          );
          Navigator.popAndPushNamed(context, AppRoute.dashboardRoute);
        },
      );
    } catch (e) {
      state = state.copyWith(
        error: 'Error sending mail',
        isLoading: false,
        showMessage: true,
      );
    }
  }

  void handleSuccess(BuildContext context, String message) {
    state = state.copyWith(isLoading: false, error: null);
    showSnackBar(message: message, context: context);
    // Add any additional navigation logic if needed
  }

  void handleFailure(BuildContext context, Failure failure) {
    state = state.copyWith(
      isLoading: false,
      error: failure.error,
    );
    showSnackBar(message: failure.error, context: context, color: Colors.red);
  }

  Future<void> updateUserPassword(String currentPassword, String newPassword,
      String confirmPassword, BuildContext context) async {
    try {
      state = state.copyWith(isLoading: true);
      final result = await _passwordUseCase.updateUserPassword(
          currentPassword, newPassword, confirmPassword);
      state = state.copyWith(isLoading: false);
      result.fold(
        (failure) {
          state = state.copyWith(
            error: failure.error,
            isLoading: false,
            showMessage: true,
          );
          showSnackBar(
            message: state.error!,
            context: context,
            color: Colors.red[900],
          );
        },
        (success) {
          state = state.copyWith(
            isLoading: false,
            message: success,
            showMessage: true,
            error: null,
          );
          showSnackBar(
            message: state.message!,
            context: context,
          );
          Navigator.popAndPushNamed(context, AppRoute.dashboardRoute);
        },
      );
    } catch (e) {
      state = state.copyWith(
        error: 'Error updating password',
        isLoading: false,
        showMessage: true,
      );
    }
  }

  Future<void> updateUserProfile(String firstName, String lastName,
      String email, File image, BuildContext context) async {
    try {
      state = state.copyWith(isLoading: true);
      final result = await _updateProfileUsecase.updateProfile(
          firstName, lastName, email, image);
      state = state.copyWith(isLoading: false);
      result.fold(
        (failure) {
          state = state.copyWith(
            error: failure.error,
            isLoading: false,
            showMessage: true,
          );
          showSnackBar(
            message: state.error!,
            context: context,
            color: Colors.red[900],
          );
        },
        (success) {
          state = state.copyWith(
            isLoading: false,
            message: success,
            showMessage: true,
            error: null,
          );
          showSnackBar(
            message: state.message!,
            context: context,
          );
          Navigator.popAndPushNamed(context, AppRoute.dashboardRoute);
        },
      );
    } catch (e) {
      state = state.copyWith(
        error: 'Error updating password',
        isLoading: false,
        showMessage: true,
      );
    }
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
