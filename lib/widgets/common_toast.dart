import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/**
 * 弹窗封装
 */
class CommonToast {
  FToast? _fToast;
  late BuildContext context;

  CommonToast._init(context) {
    if (_fToast == null) {
      _fToast = FToast();
      _fToast!.init(context);
    }
  }

  static showToast(String msg, int timeInSecForIosWeb) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: timeInSecForIosWeb,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
