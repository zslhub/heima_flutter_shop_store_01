import 'package:flutter/material.dart';
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
  final List<BannerItem> _bannerList = [
    BannerItem(
      id: '1',
      imgUrl:
          'https://qlogo4.store.qq.com/qzone/2191055003/2191055003/100?1715830718',
    ),
    BannerItem(
      id: '1',
      imgUrl:
          'https://qlogo3.store.qq.com/qzone/1442023530/1442023530/50?1725717522',
    ),
    BannerItem(
      id: '1',
      imgUrl:
          'https://qlogo1.store.qq.com/qzone/1427406232/1427406232/50?1700365101',
    ),
  ];
  List<Widget> getScrollViewChildren() {
    return [
      // 轮播图
      SliverToBoxAdapter(child: HmSlider(bannerList: _bannerList)),
      SliverToBoxAdapter(child: SizedBox(height: 20)),
      // 分类
      SliverToBoxAdapter(child: HmCategory()),
      SliverToBoxAdapter(child: SizedBox(height: 20)),
      // 推荐
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: HmSuggestion(),
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
              Expanded(child: HmHot()),
              SizedBox(width: 10),
              Expanded(child: HmHot()),
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
