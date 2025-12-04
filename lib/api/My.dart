import 'package:heima_flutter_shop_store_01/constants/index.dart';
import 'package:heima_flutter_shop_store_01/utils/DioRequest.dart';
import 'package:heima_flutter_shop_store_01/viewmodels/home.dart';

Future<GoodsDetailItems> getGuessListAPI(Map<String, dynamic> params) async {
  // 返回请求
  return GoodsDetailItems.formJSON(
    await dioRequest.get(HttpConstants.GUESS_LIST, params: params),
  );
}
