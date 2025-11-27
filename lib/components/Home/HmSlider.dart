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
  final CarouselSliderController _carouselSliderController =
      CarouselSliderController();
  int _activeDotIndex = 0;
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
        onPageChanged: (index, reason) {
          setState(() {
            _activeDotIndex = index;
          });
        },
      ),
      carouselController: _carouselSliderController,
    );
  }

  Widget _getSearch() {
    return Positioned(
      top: 10,
      left: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: 40,
          decoration: BoxDecoration(
            color: Color.fromRGBO(0, 0, 0, 0.4),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            '搜索',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }

  Widget _getDots() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: SizedBox(
        height: 40,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.bannerList.length, (int index) {
            return GestureDetector(
              onTap: () {
                _carouselSliderController.jumpToPage(index);
              },
              child: AnimatedContainer(
                height: 10,
                width: index == _activeDotIndex ? 40 : 20,
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: index == _activeDotIndex
                      ? Colors.white
                      : Color.fromRGBO(0, 0, 0, 0.5),
                  borderRadius: BorderRadius.circular(5),
                ),
                duration: Duration(milliseconds: 500),
              ),
            );
          }),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Container(
        //   alignment: Alignment.center,
        //   height: 200,
        //   color: Colors.blue,
        //   child: Text(
        //     '轮播图',
        //     style: TextStyle(color: Colors.white, fontSize: 20),
        //   ),
        // ),
        _getSlider(),
        _getSearch(),
        _getDots(),
      ],
    );
  }
}
