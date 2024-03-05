import 'package:TribalTrove/core/failure/failure.dart';
import 'package:TribalTrove/feature/user/authentication_user/domain/entity/auth_entity.dart';
import 'package:TribalTrove/feature/user/authentication_user/domain/use_cases/login_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_unit_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<LoginUseCase>(),
  MockSpec<BuildContext>(),
])
void main() {
  late MockLoginUseCase mockLoginUseCase;
  late AuthEntity mockAuthEntity;

  setUpAll(() async {
    mockLoginUseCase = MockLoginUseCase();
  });

  group('test login', () {
    setUpAll(() async {
      /// Creating a proper mock user for loggin in
      mockAuthEntity = AuthEntity(
        userID: '1234567890',
        firstName: 'Test',
        lastName: 'User',
        phoneNumber: '986453944',
        email: 'test@example.com',
        password: 'password',
      );
      when(
        mockLoginUseCase.loginUser(
          'test@example.com',
          'password',
        ),
      ).thenAnswer(
        (_) async =>
            Right<Failure, bool>((mockAuthEntity.userID ?? '') as bool),
      );
    });
  });

//test with proper credential
  test('test login with proper credentials', () async {
    // Call the login method
    final result = await mockLoginUseCase.loginUser(
      'test@example.com',
      'password',
    );

    // Verify the expected result
    expect(result, Right<Failure, bool>((mockAuthEntity.userID ?? '') as bool));
  });

// test login with invalid email
  test('test login with invalid email', () async {
    final mockErrorModel = Failure(
      error: 'User with email not found',
    );
    when(
      mockLoginUseCase.loginUser(
        'test22@example.com',
        'password',
      ),
    ).thenAnswer(
      (_) async => Left(mockErrorModel),
    );

    final result = await mockLoginUseCase.loginUser(
      'test22@example.com',
      'password',
    );

    expect(result, Left(mockErrorModel));
  });

// test login with invalid password
  test('test login with invalid password', () async {
    final mockErrorModel = Failure(
      error: 'Invalid Password',
    );
    when(
      mockLoginUseCase.loginUser(
        'test@example.com',
        'password000',
      ),
    ).thenAnswer(
      (_) async => Left(mockErrorModel),
    );
    final result = await mockLoginUseCase.loginUser(
      'test@example.com',
      'password000',
    );
    expect(
      result,
      Left(mockErrorModel),
    );
  });

// test login with null email
  test('test login with null email', () async {
    final mockErrorModel = Failure(
      error: 'Please enter email',
    );
    when(
      mockLoginUseCase.loginUser(
        null,
        'password',
      ),
    ).thenAnswer(
      (_) async => Left(mockErrorModel),
    );
    final result = await mockLoginUseCase.loginUser(
      null,
      'password',
    );
    expect(
      result,
      Left(mockErrorModel),
    );
  });


//test login with null password
  test('test login with null password', () async {
    final mockErrorModel = Failure(
      error: 'Please enter password',
    );
    when(
      mockLoginUseCase.loginUser(
        'test@example.com',
        null,
      ),
    ).thenAnswer(
      (_) async => Left(mockErrorModel),
    );
    final result = await mockLoginUseCase.loginUser(
      'test@example.com',
      null,
    );
    expect(
      result,
      Left(mockErrorModel),
    );
  });
}
