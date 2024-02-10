import 'package:equatable/equatable.dart';

class AuthEntitySeller extends Equatable {
  final String? sellerID;
  final String businessName;
  final String businessPhone;
  final String businessAddress;
  // final String? image;
  final String email;
  final String password;

  const AuthEntitySeller({
    this.sellerID,
    required this.businessName,
    required this.businessPhone,
    // this.image,
    required this.businessAddress,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [
        sellerID,
        businessName,
        businessPhone,
        businessAddress,
        email,
        password,
      ];
}
