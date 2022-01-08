// ignore: import_of_legacy_library_into_null_safe
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/pages/home/index.dart';
import 'package:untitled1/pages/index.dart';
import 'package:untitled1/pages/home/common_page/login.dart';
import 'package:untitled1/pages/home/common_page/not_found.dart';

class Routes {
  //定义路由名称
  static String home = '/home';
  static String login = '/';
  static String roomDetail = '/room/:roomId';

  //定义路由器处理函数
  static Handler _homeHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return HomePage();
  });
  static Handler _loginHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return LoginPage();
  });

  static Handler _notFoundHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return NotFoundPage();
  });
  static Handler _roomDetailHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return RoomDetailPage(
      roomId: params['roomId'][0],
    );
  });

  //编写函数
  static void configRoutes(FluroRouter router) {
    router.define(login, handler: _loginHandler);
    router.define(home, handler: _homeHandler);
    router.define(roomDetail, handler: _roomDetailHandler);
    router.notFoundHandler = _notFoundHandler;
  }
}
