import 'package:flutter/material.dart';
import 'package:heima_flutter_shop_store_01/viewmodels/home.dart';

class HmSuggestion extends StatefulWidget {
  final SpecialRecommend specialRecommend;
  const HmSuggestion({super.key, required this.specialRecommend});

  @override
  State<HmSuggestion> createState() => _HmSuggestionState();
}

class _HmSuggestionState extends State<HmSuggestion> {
  List<GoodsItem> _getDisplayItems() {
    if (widget.specialRecommend.subTypes.isEmpty) {
      return [];
    }
    return widget.specialRecommend.subTypes.first.goodsItems.items
        .take(3)
        .toList();
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Text(
          '特惠推荐',
          style: TextStyle(
            color: Colors.red,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(width: 10),
        Text(
          '精选攻略',
          style: TextStyle(
            color: const Color.fromARGB(255, 249, 131, 123),

            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Widget _buildLeft() {
    return Container(
      width: 80,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        image: DecorationImage(
          image: AssetImage('lib/assets/home_cmd_inner.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  List<Widget> _getChildrenList() {
    List<GoodsItem> displayItems = _getDisplayItems();
    return List.generate(displayItems.length, (index) {
      return Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'lib/assets/home_cmd_inner.png',
                  width: 70,
                  height: 100,
                );
              },
              displayItems[index].picture,
              width: 70,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 197, 109, 109),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text('\$${displayItems[index].price}'),
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 200,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.blue,
        image: DecorationImage(
          image: AssetImage('lib/assets/home_cmd_sm.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          _buildHeader(),
          SizedBox(height: 10),
          Row(
            children: [
              _buildLeft(),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: _getChildrenList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
