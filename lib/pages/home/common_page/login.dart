import 'dart:async';
import 'dart:convert';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/pages/home/scoped_model/auto.dart';
import 'package:untitled1/util/Scoped_model_helper.dart';
import 'package:untitled1/util/dio4.0/dio_util.dart';
import 'package:untitled1/util/store/store.dart';
import 'package:untitled1/widgets/common_toast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var userNameController = TextEditingController();
  var passwordController = TextEditingController();

  _loginHandle() async {
    var userName = userNameController.text;
    var password = passwordController.text;
    if (ObjectUtil.isEmpty(userName) || ObjectUtil.isEmpty(password)) {
      //用户名或密码不能为空！
      CommonToast.showToast('用户名或密码不能为空!', 2000);
      return;
    }
    const url = '/login';
    var params = {
      'userName': userName,
      'password': password,
      // 'openId':Config.openId,
    };
    // DioUtil().setProxy(proxyAddress: 'www.baidu.com', enable: true);
    // DioUtil().openLog();
    DioUtil.instance.openLog();
    var res = await DioUtil().request(url, params: params);
    if (res.code == 200) {
      CommonToast.showToast('登录成功', 1000);
    }
    // var res = DioHttp.of(context).postRequst(url, params);
    // var data = jsonDecode(res.toString());
    // int status = data['status'];
    // String description = data['description'] ?? '内部错误';
    // print(data.toString());
    // print(status.toInt());
    // print(description.toString());
    // // CommonToast.showText(description);
    // if (status.toString().startsWith('2')) {
    //   String token = resMap['body']['token'];

    //   Store store = await Store.getInstance();
    //   await store.setString(StoreKeys.token, token);
    //   ScopedModelHelper.getModel<AuthModel>(context).login(token, context);
    //   Timer(Duration(seconds: 1), () {
    //     Navigator.of(context).pop();
    //   });
    // }
  }

  bool showPwd = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('登录'),
          centerTitle: true,
        ),
        body: SafeArea(
          minimum: EdgeInsets.all(30),
          child: ListView(
            children: <Widget>[
              TextField(
                controller: userNameController,
                decoration:
                    InputDecoration(labelText: '用户名', hintText: '请输入用户名'),
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: '密码',
                      hintText: '请输入密码',
                      suffixIcon: IconButton(
                          icon: Icon(showPwd
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              showPwd = !showPwd;
                            });
                          }))),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                    //设置按下时的背景颜色
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.green[200];
                    }
                    //默认不使用背景颜色
                    return null;
                  }),
                ),
                // color: Colors.green,
                child: Text(
                  '登录',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  _loginHandle();
                  // Navigator.pushReplacementNamed(context, "/home");
                },
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('还没有账号呢,'),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        '去注册~',
                        style: TextStyle(color: Colors.green),
                      ))
                ],
              )
            ],
          ),
        ));
  }
}
