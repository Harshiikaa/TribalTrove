import 'package:TribalTrove/core/failure/failure.dart';
import 'package:TribalTrove/feature/user/authentication_user/domain/entity/auth_entity.dart';
import 'package:TribalTrove/feature/user/authentication_user/domain/use_cases/register_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'sign_up_unit_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<RegisterUseCase>(),
  MockSpec<BuildContext>(),
])
void main() {
  late MockRegisterUseCase mockRegisterUseCase;
  setUpAll(() async {
    mockRegisterUseCase = MockRegisterUseCase();
  });

  group('test register', () {
    setUpAll(() {
      when(
        mockRegisterUseCase.registerUser(AuthEntity(
          firstName: 'Test',
          lastName: 'User',
          phoneNumber: '9875679946',
          email: 'test@example.com',
          password: 'password',
        )),
      ).thenAnswer(
        (_) async => Right<Failure, bool>(true),
      );
    });

// testing sign up with proper credential
    test('test signup with proper cradential', () async {
      // Call the login method
      final result = await mockRegisterUseCase.registerUser(AuthEntity(
          firstName: 'Test',
          lastName: 'User',
          email: 'test@example.com',
          password: 'password',
          phoneNumber: '9867583745'));

      // Verify the expected result
      expect(result, const Right(true));
    });

// testing sign up with invalid credentials
    test('test signup with invalid credentials', () async {
      final mockErrorModel = Failure(
        error: 'Please enter valid email',
      );
      when(
        mockRegisterUseCase.registerUser(AuthEntity(
            email: 'test@mail',
            password: 'user123456',
            firstName: '465465465a4s465da54s@#321',
            lastName: 'User',
            phoneNumber: '9867583745')),
      ).thenAnswer(
        (_) async => Left(mockErrorModel),
      );
      final result = await mockRegisterUseCase.registerUser(AuthEntity(
        email: 'test@as',
        password: '4444444',
        firstName: '465465465a4s465da54s@#321',
        lastName: 'User',
        phoneNumber: '9867583745',
      ));
      expect(
        result,
        Left(mockErrorModel),
      );
    });


// testing sign up with no credentials
    test('test signup with no credentials', () async {
      final mockErrorModel = Failure(
        error: 'Please enter email',
      );
      when(
        mockRegisterUseCase.registerUser(AuthEntity(
          email: '',
          password: '',
          firstName: '',
          lastName: '',
          phoneNumber: '',
        )),
      ).thenAnswer(
        (_) async => Left(mockErrorModel),
      );
      final result = await mockRegisterUseCase.registerUser(AuthEntity(
        email: '',
        password: '',
        firstName: '',
        lastName: '',
        phoneNumber: '',
      ));
      expect(
        result,
        Left(mockErrorModel),
      );
    });
  });
}
