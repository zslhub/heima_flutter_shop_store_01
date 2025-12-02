import 'package:flutter/material.dart';
import 'package:heima_flutter_shop_store_01/viewmodels/home.dart';

class HmMoreList extends StatefulWidget {
  // 推荐列表
  final List<GoodDetailItem> recommendList;

  const HmMoreList({super.key, required this.recommendList});

  @override
  HmMoreListState createState() => HmMoreListState();
}

class HmMoreListState extends State<HmMoreList> {
  Widget _getChildren(int index) {
    return Column(
      children: [
        // ClipRRect用于裁剪圆角，创建圆角矩形片段。
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          // AspectRatio创建具有特定纵横比的小部件。
          child: AspectRatio(
            aspectRatio: 1.0,
            child: Image.network(
              widget.recommendList[index].picture,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  "lib/assets/home_cmd_inner.png",
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
        ),
        SizedBox(height: 5),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            widget.recommendList[index].name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
        ),
        SizedBox(height: 5),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  text: "¥${widget.recommendList[index].price}",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                  ),
                  children: [
                    TextSpan(text: " "),
                    TextSpan(
                      text: widget.recommendList[index].price,
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "${widget.recommendList[index].payCount}人付款",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // 必须是Sliver家族的组件
    return SliverGrid.builder(
      itemCount: widget.recommendList.length,
      gridDelegate:
          // 网格是两列
          SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.75,
          ),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: _getChildren(index),
        );
      },
    );
  }
}
