import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String? userID;
  final String firstName;
  final String lastName;
  final String email;
  // final String? image;
  final String phoneNumber;
  final String password;

  const AuthEntity({
    this.userID,
    required this.firstName,
    required this.lastName,
    required this.email,
    // this.image,
    required this.phoneNumber,
    required this.password,
  });

  @override
  List<Object?> get props => [
        userID,
        firstName,
        lastName,
        email,
        phoneNumber,
        // username,
        password,
        
      ];
}
