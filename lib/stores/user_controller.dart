import 'package:get/get.dart';
import 'package:heima_flutter_shop_store_01/viewmodels/user.dart';

class UserController extends GetxController {
  Rx<UserInfo> user = UserInfo.fromJSON({}).obs;
  updateUserInfo(UserInfo newUser) {
    user.value = newUser;
  }
}
