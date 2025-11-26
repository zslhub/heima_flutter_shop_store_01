// 管理路由
import 'package:flutter/material.dart';
import 'package:heima_flutter_shop_store_01/pages/Login/index.dart';
import 'package:heima_flutter_shop_store_01/pages/Main/index.dart';

// 返回根组件
Widget getRootWidget() {
  return MaterialApp(routes: getRootRoutes());
}

// 通过一个函数返回app的路由配置
Map<String, Widget Function(BuildContext)> getRootRoutes() {
  return {
    '/': (context) => MainPage(), // 主页路由
    '/login': (context) => LoginPage(), // 登录路由
  };
}
