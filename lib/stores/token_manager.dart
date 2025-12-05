import 'package:heima_flutter_shop_store_01/constants/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenManager {
  // 获取SharedPreferences实例
  Future<SharedPreferences> _getInstance() {
    return SharedPreferences.getInstance();
  }

  String _token = '';
  // 初始化token
  Future<void> init() async {
    // 获取_getInstance返回的实例
    final prefs = await _getInstance();
    _token = prefs.getString(GlobalConstants.TOKEN_KEY) ?? '';
  }

  // 设置token
  Future<void> setToken(String token) async {
    final prefs = await _getInstance();
    // 保存token到本地存储
    prefs.setString(GlobalConstants.TOKEN_KEY, token);
    // 更新内存中的token
    _token = token;
  }

  // 获取token
  String getToken()  {
    return _token;
  }

  // 清除token
  clearToken() async {
    final prefs = await _getInstance();
    prefs.remove(GlobalConstants.TOKEN_KEY);
    _token = '';
  }
}

final TokenManager tokenManager = TokenManager();
