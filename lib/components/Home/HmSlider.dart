import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:heima_flutter_shop_store_01/viewmodels/home.dart';

class HmSlider extends StatefulWidget {
  final List<BannerItem> bannerList;
  const HmSlider({super.key, required this.bannerList});

  @override
  State<HmSlider> createState() => _HmSliderState();
}

class _HmSliderState extends State<HmSlider> {
  Widget _getSlider() {
    // 在flutter中获取屏幕宽度
    final screenWidth = MediaQuery.of(context).size.width;
    return CarouselSlider(
      items: List.generate(widget.bannerList.length, (int index) {
        return Image.network(
          widget.bannerList[index].imgUrl!,
          fit: BoxFit.cover,
          width: screenWidth,
        );
      }),
      
      options: CarouselOptions(
        // 设置占比
        viewportFraction: 1,
        // 自动轮播
        autoPlay: true,
        // 轮播间隔时间
        autoPlayInterval: Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _getSlider(),
        // Container(
        //   alignment: Alignment.center,
        //   height: 200,
        //   color: Colors.blue,
        //   child: Text(
        //     '轮播图',
        //     style: TextStyle(color: Colors.white, fontSize: 20),
        //   ),
        // ),
      ],
    );
  }
}
