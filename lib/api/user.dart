import 'package:heima_flutter_shop_store_01/constants/index.dart';
import 'package:heima_flutter_shop_store_01/utils/DioRequest.dart';
import 'package:heima_flutter_shop_store_01/viewmodels/user.dart';

Future<UserInfo> loginAPI(Map<String, dynamic> data) async {
  return UserInfo.fromJSON(
    await dioRequest.post(HttpConstants.LOGIN, data: data),
  );
}
