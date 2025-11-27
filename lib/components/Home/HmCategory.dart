import 'package:flutter/material.dart';

class HmCategory extends StatefulWidget {
  const HmCategory({super.key});

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
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            width: 50,
            height: 75,
            color: Colors.blue,
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              '分类${index + 1}',
              style: TextStyle(color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}
