import 'package:dio/dio.dart';
import 'package:heima_flutter_shop_store_01/constants/index.dart';
import 'package:heima_flutter_shop_store_01/stores/token_manager.dart';

class DioRequest {
  final _dio = Dio();
  // 配置请求基本信息
  DioRequest() {
    _dio.options
      ..baseUrl = GlobalConstants.BASE_URL
      ..connectTimeout = Duration(seconds: GlobalConstants.TIME_OUT)
      ..receiveTimeout = Duration(seconds: GlobalConstants.TIME_OUT)
      ..sendTimeout = Duration(seconds: GlobalConstants.TIME_OUT);
    _addInterceptor();
  }

  // 拦截器
  void _addInterceptor() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        // 请求拦截器
        onRequest: (request, handler) {
          if (tokenManager.getToken().isNotEmpty) {
            request.headers = {
              "Authorization": 'Bearer ${tokenManager.getToken()}',
            };
          }

          handler.next(request);
        },
        // 响应拦截器
        onResponse: (response, handler) {
          // 判断响应状态码
          if (response.statusCode! >= 200 && response.statusCode! < 300) {
            handler.next(response);
            return;
          }
          handler.reject(DioException(requestOptions: response.requestOptions));
        },
        // 错误抛出
        onError: (error, handler) {
          // handler.reject(error);
          handler.reject(
            DioException(
              requestOptions: error.requestOptions,
              message: error.response?.data['msg'] ?? '加载数据异常',
            ),
          );
        },
      ),
    );
  }

  // 封装get请求方法
  Future<dynamic> get(String url, {Map<String, dynamic>? params}) {
    return _handleResponse(_dio.get(url, queryParameters: params));
  }

  // 封装post请求方法
  Future<dynamic> post(String url, {Map<String, dynamic>? data}) {
    return _handleResponse(_dio.post(url, data: data));
  }

  Future<dynamic> _handleResponse(Future<Response<dynamic>> task) async {
    try {
      // 等待get返回数据
      Response<dynamic> res = await task;
      final data = res.data as Map<String, dynamic>;
      // 判断业务状态正常返回数据
      if (data['code'] == GlobalConstants.SUCCESS_CODE) {
        return data['result'];
      }
      // 抛出异常
      // throw Exception(data['msg'] ?? '加载数据异常');
      throw DioException(
        requestOptions: res.requestOptions,
        message: data['msg'] ?? '加载数据异常',
      );
    } catch (e) {
      // 其他异常
      // throw Exception(e);
      rethrow;
    }
  }
}

// 单例对象
final dioRequest = DioRequest();
