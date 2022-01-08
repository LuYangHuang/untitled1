import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:untitled1/config.dart';
import 'package:untitled1/util/dio4.0/dio_response.dart';
import 'package:untitled1/util/dio4.0/dio_response_code.dart';
import 'package:untitled1/util/dio4.0/dio_token_interceptions.dart';

enum DioMethod {
  get,
  post,
  put,
  delete,
  patch,
  head,
}

/**
 * dio的封装|
 * 代码切换|
 * 切换第三方库|
 * 统一管理|
 * 单例
 */
class DioUtil {
  /// 连接超时时间
  static const int CONNECT_TIMEOUT = 60 * 1000;

  /// 响应超时时间
  static const int RECEIVE_TIMEOUT = 60 * 1000;

  ///是否开启网络缓存
  static const CACHE_ENABLE = false;

  ///网络缓存最大时间
  static const MAX_CACHE_AGE = 7 * 24 * 60 * 60;

  ///最大魂村条数（默认100）
  static const MAX_CACHE_COUNT = 100;

  factory DioUtil() => _getInstance();
  static DioUtil get instance => _getInstance();
  static DioUtil? _instance = null;
  Dio? get dio => _dio;

  /// 声明Dio变量
  Dio? _dio;

  /// cookie
  CookieJar cookieJar = CookieJar();

  /// 取消请求token
  CancelToken _cancelToken = CancelToken();

  DioUtil._init() {
    // 初始化
    if (_dio == null) {
      /// 初始化基本选项
      BaseOptions options = BaseOptions(
          baseUrl: Config.BaseUrl,
          connectTimeout: CONNECT_TIMEOUT,
          receiveTimeout: RECEIVE_TIMEOUT);

      /// 初始化dio
      _dio = Dio(options);

      /// 添加cookie管理器
      // _dio!.interceptors.add(CookieManager(cookieJar));

      // ///刷新token拦截器
      // _dio!.interceptors.add(DioTokenInterceptors());

      // ///添加缓存拦截器
      // _dio!.interceptors.add(DioTokenInterceptors());
    }
  }

  static DioUtil _getInstance() {
    if (_instance == null) {
      _instance = DioUtil._init();
    }
    return _instance!;
  }

  /// 请求类
  Future<DioResponse<T>> request<T>(
    String path, {
    DioMethod method = DioMethod.get,
    Map<String, dynamic>? params,
    data,
    CancelToken? cancelToken,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    const _methodValues = {
      DioMethod.get: 'get',
      DioMethod.post: 'post',
      DioMethod.put: 'put',
      DioMethod.delete: 'delete',
      DioMethod.patch: 'patch',
      DioMethod.head: 'head'
    };

    options ??= Options(method: _methodValues[method]);
    try {
      DioResponse<T> response = (await _dio!.request(path,
          data: data,
          queryParameters: params,
          cancelToken: cancelToken,
          options: options,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress)) as DioResponse<T>;
      return response;
    } on DioError catch (e) {
      throw e;
    }
  }

  /// 取消网络请求
  void cancelRequests({CancelToken? token}) {
    token ?? _cancelToken.cancel("cancelled");
  }

  /**设置Http代理(设置即开启)
   * 在我们用flutter进行抓包的时候需要配置Dio代理。
   * 由DefaultHttpClientAdapter 
   * 提供了一个onHttpClientCreate 回调来设置底层 HttpClient的代理。 */
  void setProxy({required String proxyAddress, bool enable = false}) {
    if (enable) {
      (_dio?.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.findProxy = (uri) {
          return proxyAddress;
        };
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
      };
    }
  }

  /**
   * 设置https证书校验
   * 用于验证正在访问的网站是否真实。提供安全性，因为证书和域名绑定，
   * 并且由根证书机构签名确认。
   */
  void setHttpsCertificateVerification(
      {required String pem, bool enable = false}) {
    if (enable) {
      (_dio?.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) {
          if (cert.pem == pem) {
            // 验证证书
            return true;
          }
          return false;
        };
      };
    }
  }

  /// 开启日志打印
  void openLog() {
    _dio?.interceptors.add(LogInterceptor(responseBody: true));
  }

  // List<Cookie> cookies = [
  //   // Cookie("xxx", xxx),
  //   // ....
  // ];
}
