import 'package:flutter/material.dart';
import 'package:heima_flutter_shop_store_01/components/Home/HmCategory.dart';
import 'package:heima_flutter_shop_store_01/components/Home/HmHot.dart';
import 'package:heima_flutter_shop_store_01/components/Home/HmMoreList.dart';
import 'package:heima_flutter_shop_store_01/components/Home/HmSlider.dart';
import 'package:heima_flutter_shop_store_01/components/Home/Hmsuggestion.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Widget> getScrollViewChildren() {
    return [
      // 轮播图
      SliverToBoxAdapter(child: HmSlider()),
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
      // 滚动列表
      HmMoreList(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: getScrollViewChildren());
  }
}
