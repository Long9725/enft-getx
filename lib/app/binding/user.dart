import 'package:get/get.dart';

import 'package:enft/app/controller/user.dart';
import 'package:enft/app/data/provider/user_api.dart';
import 'package:enft/app/data/provider/sqflite_api.dart';
import 'package:enft/app/data/repository/sqflite.dart';
import 'package:enft/app/data/repository/user.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut<UserController>(() => UserController(
        userRepository: UserRepository(
            userApiClient: UserApiClient()),
        sqfliteRepository: SqfliteRepository(api: SqfliteApi())));
  }
}
