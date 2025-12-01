class BannerItem {
  String? id;
  String? imgUrl;
  BannerItem({required this.id, required this.imgUrl});
  // 扩展一个工厂函数，用factory来声明，一般用来创建实例对象
  factory BannerItem.formJSON(Map<String, dynamic> json) {
    // 必须返回一个BannerItem对象
    return BannerItem(id: json['id'] ?? '', imgUrl: json['imgUrl'] ?? '');
  }
}

class CategoryItem {
  String id;
  String name;
  String picture;
  List<CategoryItem>? children;
  CategoryItem({
    required this.id,
    required this.name,
    required this.picture,
    this.children,
  });
  factory CategoryItem.formJSON(Map<String, dynamic> json) {
    return CategoryItem(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      picture: json['picture'] ?? '',
      children: json['children'] == null
          ? null
          : (json['children'] as List)
                .map(
                  (item) => CategoryItem.formJSON(item as Map<String, dynamic>),
                )
                .toList(),
    );
  }
}

// 商品项
class GoodsItem {
  String id;
  String name;
  String? desc;
  String price;
  String picture;
  int orderNum;

  GoodsItem({
    required this.id,
    required this.name,
    this.desc,
    required this.price,
    required this.picture,
    required this.orderNum,
  });

  factory GoodsItem.formJSON(Map<String, dynamic> json) {
    return GoodsItem(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      desc: json['desc'],
      price: json['price'] ?? '0.00',
      picture: json['picture'] ?? '',
      orderNum: json['orderNum'] ?? 0,
    );
  }
}

// 商品分页信息
class GoodsPageInfo {
  int counts;
  int pageSize;
  int pages;
  int page;
  List<GoodsItem> items;

  GoodsPageInfo({
    required this.counts,
    required this.pageSize,
    required this.pages,
    required this.page,
    required this.items,
  });

  factory GoodsPageInfo.formJSON(Map<String, dynamic> json) {
    return GoodsPageInfo(
      counts: json['counts'] ?? 0,
      pageSize: json['pageSize'] ?? 10,
      pages: json['pages'] ?? 0,
      page: json['page'] ?? 1,
      items: json['items'] == null
          ? []
          : (json['items'] as List)
              .map((item) => GoodsItem.formJSON(item as Map<String, dynamic>))
              .toList(),
    );
  }
}

// 特惠推荐子类型
class RecommendSubType {
  String id;
  String title;
  GoodsPageInfo goodsItems;

  RecommendSubType({
    required this.id,
    required this.title,
    required this.goodsItems,
  });

  factory RecommendSubType.formJSON(Map<String, dynamic> json) {
    return RecommendSubType(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      goodsItems: GoodsPageInfo.formJSON(
        json['goodsItems'] ?? {},
      ),
    );
  }
}

// 特惠推荐主类
class SpecialRecommend {
  String id;
  String title;
  List<RecommendSubType> subTypes;

  SpecialRecommend({
    required this.id,
    required this.title,
    required this.subTypes,
  });

  factory SpecialRecommend.formJSON(Map<String, dynamic> json) {
    return SpecialRecommend(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      subTypes: json['subTypes'] == null
          ? []
          : (json['subTypes'] as List)
              .map(
                (item) => RecommendSubType.formJSON(
                  item as Map<String, dynamic>,
                ),
              )
              .toList(),
    );
  }
}

