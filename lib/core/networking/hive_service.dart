import 'package:TribalTrove/config/constants/hive_table_constant.dart';
import 'package:TribalTrove/feature/user/authentication_user/data/model/auth_hive_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';



// Create object using a provider
final hiveServiceProvider = Provider<HiveService>(
  (ref) => HiveService(),
);

class HiveService {
  Future<void> init() async {
    var directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);

    // Register Adapters
    Hive.registerAdapter(AuthHiveModelAdapter());
  }

  // ======================== Auth Buyer Queries ========================

  Future<void> registerUser(AuthHiveModel auth) async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
    await box.put(auth.userID, auth);
  }

  // Login
  Future<AuthHiveModel?> loginUser(String email, String password) async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
    var auths = box.values.toList();
    var auth = auths.firstWhere(
      (element) => element.email == email && element.password == password,
      orElse: () => AuthHiveModel.empty(),
    );
    return auth;
  }

  Future<List<AuthHiveModel>> getAllUser() async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
    var auths = box.values.toList();
    return auths;
  }

  Future<void> deleteUser(String userId) async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
    await box.delete(userId);
  }


  // ======================== Auth Seller Queries ========================

  //   Future<void> registerSeller(AuthHiveModelSeller auth) async {
  //   var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.sellerBox);
  //   await box.put(auth.sellerId, auth);
  // }

  // // Login
  // Future<AuthHiveModel?> loginSeller(String email, String password) async {
  //   var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.sellerBox);
  //   var auths = box.values.toList();
  //   var auth = auths.firstWhere(
  //     (element) => element.email == email && element.password == password,
  //     orElse: () => AuthHiveModel.empty(),
  //   );
  //   return auth;
  // }

  // Future<List<AuthHiveModel>> getAllSeller() async {
  //   var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.sellerBox);
  //   var auths = box.values.toList();
  //   return auths;
  // }

  // Future<void> deleteSeller(String sellerId) async {
  //   var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.sellerBox);
  //   await box.delete(sellerId);
  // }


  // Delete hive
  Future<void> deleteHive() async {
    await Hive.deleteBoxFromDisk(HiveTableConstant.userBox);
  }
}
