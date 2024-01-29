import 'package:equatable/equatable.dart';

class AuthEntitySeller extends Equatable {
  final String? sellerId;
  final String businessName;
  final String businessPhone;
  final String businessAddress;
  // final String? image;
  final String email;
  final String password;

  const AuthEntitySeller({
    this.sellerId,
    required this.businessName,
    required this.businessPhone,
    // this.image,
    required this.businessAddress,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [
        sellerId,
        businessName,
        businessPhone,
        businessAddress,
        email,
        password,
      ];
}
