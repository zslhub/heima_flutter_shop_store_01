import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heima_flutter_shop_store_01/api/user.dart';
import 'package:heima_flutter_shop_store_01/pages/Cart/index.dart';
import 'package:heima_flutter_shop_store_01/pages/Category/index.dart';
import 'package:heima_flutter_shop_store_01/pages/Home/index.dart';
import 'package:heima_flutter_shop_store_01/pages/My/index.dart';
import 'package:heima_flutter_shop_store_01/stores/token_manager.dart';
import 'package:heima_flutter_shop_store_01/stores/user_controller.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final UserController _userController = Get.put(UserController());
  @override
  void initState() {
    super.initState();
    _initUser();
  }
  _initUser() async {
    await tokenManager.init();  // 初始化token
    if (tokenManager.getToken().isNotEmpty) {
      _userController.updateUserInfo(await getUserInfoAPI()) ;
    }
  }
  // 定义数据 根据数据进行渲染四个导航
  final List<Map<String, String>> _tabList = [
    {
      'text': '首页',
      'icon': 'lib/assets/ic_public_home_normal.png',
      'active_icon': 'lib/assets/ic_public_home_active.png',
    },
    {
      'text': '分类',
      'icon': 'lib/assets/ic_public_pro_normal.png',
      'active_icon': 'lib/assets/ic_public_pro_active.png',
    },
    {
      'text': '购物车',
      'icon': 'lib/assets/ic_public_cart_normal.png',
      'active_icon': 'lib/assets/ic_public_cart_active.png',
    },
    {
      'text': '我的',
      'icon': 'lib/assets/ic_public_my_normal.png',
      'active_icon': 'lib/assets/ic_public_my_active.png',
    },
  ];
  List<BottomNavigationBarItem> _getTabBarWiget() {
    return List.generate(_tabList.length, (int index) {
      return BottomNavigationBarItem(
        icon: Image.asset(_tabList[index]['icon']!, width: 30, height: 30),
        activeIcon: Image.asset(
          _tabList[index]['active_icon']!,
          width: 30,
          height: 30,
        ),
        label: _tabList[index]['text']!,
      );
    });
  }

  List<Widget> _getIndexedStack() {
    return [HomeView(), CategoryView(), CartView(), MyView()];
  }

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('主页')),
      body: SafeArea(
        child: IndexedStack(index: _currentIndex, children: _getIndexedStack()),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _getTabBarWiget(),
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.green,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.black,
      ),
    );
  }
}
