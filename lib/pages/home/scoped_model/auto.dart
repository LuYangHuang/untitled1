import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';
import 'package:untitled1/util/store/store.dart';

class AuthModel extends Model {
  String _token = '';

  String get token => _token;

  bool get isLogin => _token is String && _token != '';

  void initApp(BuildContext context) async {
    Store store = await Store.getInstance();
    String token = store.getString(StoreKeys.token);
    if (!ObjectUtil.isEmpty(token)) {
      login(token, context);
    }
  }

  void login(String token, BuildContext context) async {
    _token = token;
    notifyListeners();
  }

  void logout(BuildContext context) async {
    _token = '';
    notifyListeners();
  }
}
