import 'package:flutter/material.dart';
import 'package:heima_flutter_shop_store_01/viewmodels/home.dart';

class HmCategory extends StatefulWidget {
  // 分类组件
  final List<CategoryItem> categoryList;
  const HmCategory({super.key, required this.categoryList});

  @override
  State<HmCategory> createState() => _HmCategoryState();
}

class _HmCategoryState extends State<HmCategory> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.categoryList.length,
        itemBuilder: (context, index) {
          final category = widget.categoryList[index];
          return Container(
            alignment: Alignment.center,
            width: 50,
            height: 75,
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 222, 226, 229),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(category.picture, width: 30, height: 30),
                SizedBox(height: 5),
                Text(
                  category.name,
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
