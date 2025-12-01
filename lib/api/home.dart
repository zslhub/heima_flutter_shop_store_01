import 'package:heima_flutter_shop_store_01/constants/index.dart';
import 'package:heima_flutter_shop_store_01/utils/DioRequest.dart';
import 'package:heima_flutter_shop_store_01/viewmodels/home.dart';

// 轮播图请求API
Future<List<BannerItem>> getBannerListAPI() async {
  // 把得到的数据做类型转换后返回
   return ((await dioRequest.get(HttpConstants.BANNER_LSIT)) as List).map((
    item,
  ) {
    return  BannerItem.formJSON(item as Map<String, dynamic>);
  }).toList();


}
// 分类列表请求API
Future<List<CategoryItem>> getCategoryListAPI() async {
  return ((await dioRequest.get(HttpConstants.CATEGORY_LIST)) as List).map((
    item,
  ) {
    return  CategoryItem.formJSON(item as Map<String, dynamic>);
  }).toList();
}

// 特惠推荐商品列表请求API
Future<SpecialRecommend> getProductListAPI() async {
  return SpecialRecommend.formJSON(
    await dioRequest.get(HttpConstants.PRODUCT_LSIT),
  );
}