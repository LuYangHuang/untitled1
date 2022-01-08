import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/config.dart';

/**
 *  弃用，封装的不够强大...
 * dio的封装|
 * 代码切换|
 * 切换第三方库|
 * 统一管理|
 * get post postFormData
 */
class DioHttp {
  late Dio? dio = null;
  late BuildContext context;

  static DioHttp of(BuildContext context) {
    return DioHttp._internal(context);
  }

  DioHttp._internal(BuildContext context) {
    if (dio == null || context != this.context) {
      this.context = context;
      var options = BaseOptions(
          baseUrl: Config.BaseUrl,
          connectTimeout: 1000 * 10,
          receiveTimeout: 1000 * 3,
          extra: {'context': context});
      var client = Dio(options);
      this.dio = client;
    }
  }

  Future<Response<Map<String, dynamic>>> getqingiqu(String path,
      [Map<String, dynamic>? params, String? token]) async {
    var options = Options(headers: {'Authorization': token});
    return await dio!.get(path, queryParameters: params, options: options);
  }

  Future<Response<dynamic>> postRequst(String path,
      [Map<String, dynamic>? params, String? token]) async {
    var options = Options(headers: {'Authorization': token});
    var response =
        await dio!.post(path, queryParameters: params, options: options);

    return response;
  }

  Future<Response<Map<String, dynamic>>> postFormData(String path,
      [Map<String, dynamic>? params, String? token]) async {
    var options = Options(
        // contentType: ContentType.parse('multipart/form-data'),
        headers: {'Authorization': token});
    var formData = FormData.fromMap(params!);
    return await dio!.post(path, data: formData, options: options);
  }
}
