import 'package:flutter/material.dart';
import 'package:heima_flutter_shop_store_01/api/home.dart';
import 'package:heima_flutter_shop_store_01/components/Home/HmCategory.dart';
import 'package:heima_flutter_shop_store_01/components/Home/HmHot.dart';
import 'package:heima_flutter_shop_store_01/components/Home/HmMoreList.dart';
import 'package:heima_flutter_shop_store_01/components/Home/HmSlider.dart';
import 'package:heima_flutter_shop_store_01/components/Home/Hmsuggestion.dart';
import 'package:heima_flutter_shop_store_01/viewmodels/home.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // https://qlogo4.store.qq.com/qzone/2191055003/2191055003/100?1715830718
  // https://qlogo3.store.qq.com/qzone/1442023530/1442023530/50?1725717522
  // 	https://qlogo1.store.qq.com/qzone/1427406232/1427406232/50?1700365101

  // final List<BannerItem> _bannerList = [
  //   BannerItem(
  //     id: '1',
  //     imgUrl:
  //         'https://qlogo4.store.qq.com/qzone/2191055003/2191055003/100?1715830718',
  //   ),
  //   BannerItem(
  //     id: '1',
  //     imgUrl:
  //         'https://qlogo3.store.qq.com/qzone/1442023530/1442023530/50?1725717522',
  //   ),
  //   BannerItem(
  //     id: '1',
  //     imgUrl:
  //         'https://qlogo1.store.qq.com/qzone/1427406232/1427406232/50?1700365101',
  //   ),
  // ];

  List<BannerItem> _bannerList = [];
  List<CategoryItem> _categoryList = [];
  // 获取特惠推荐商品列表数据
  SpecialRecommend _specialRecommend = SpecialRecommend(
    id: '',
    title: '',
    subTypes: [],
  );

  @override
  void initState() {
    super.initState();
    _getBannerList();
    _getCategoryList();
    _getProductList();
    _getInVogueList();
    _getOneStopList();
  }

  // 获取BannerList数据
  _getBannerList() async {
    // 发起请求
    _bannerList = await getBannerListAPI();
    // 更新视图
    setState(() {});
  }

  // 获取分类数据
  _getCategoryList() async {
    _categoryList = await getCategoryListAPI();
    setState(() {});
  }

  _getProductList() async {
    _specialRecommend = await getProductListAPI();
    setState(() {});
  }

  // 热榜推荐
  SpecialRecommend _inVogueResult = SpecialRecommend(
    id: "",
    title: "",
    subTypes: [],
  );
  // 一站式推荐
  SpecialRecommend _oneStopResult = SpecialRecommend(
    id: "",
    title: "",
    subTypes: [],
  );

  // 获取热榜推荐列表
  void _getInVogueList() async {
    _inVogueResult = await getInVogueListAPI();
    setState(() {});
  }

  // 获取一站式推荐列表
  void _getOneStopList() async {
    _oneStopResult = await getOneStopListAPI();
    setState(() {});
  }

  List<Widget> getScrollViewChildren() {
    return [
      // 轮播图
      SliverToBoxAdapter(child: HmSlider(bannerList: _bannerList)),
      SliverToBoxAdapter(child: SizedBox(height: 20)),
      // 分类
      SliverToBoxAdapter(child: HmCategory(categoryList: _categoryList)),
      SliverToBoxAdapter(child: SizedBox(height: 20)),
      // 推荐
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: HmSuggestion(specialRecommend: _specialRecommend),
        ),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 20)),
      // 爆款
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                child: HmHot(result: _inVogueResult, type: "hot"),
              ),
              SizedBox(width: 10),
              Expanded(
                child: HmHot(result: _oneStopResult, type: "step"),
              ),
            ],
          ),
        ),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 20)),
      // 滚动列表
      HmMoreList(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: getScrollViewChildren());
  }
}
