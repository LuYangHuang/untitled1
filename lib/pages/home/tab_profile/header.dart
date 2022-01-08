import 'package:flutter/material.dart';

var loginStyle = TextStyle(fontSize: 20.0, color: Colors.white);
var loginMessageStyle = TextStyle(fontSize: 15.0, color: Colors.white);

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);
  //没有登录的函数
  Widget _notLoginBuilder(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0, left: 20.0, bottom: 20.0),
      decoration: BoxDecoration(
        color: Colors.blue,
      ),
      height: 95.0,
      child: Row(
        children: <Widget>[
          Container(
            height: 65.0,
            width: 65.0,
            margin: EdgeInsets.only(right: 15.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('url'),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 6.0),
              ),
              Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('login');
                    },
                    child: Text(
                      '登录',
                      style: loginStyle,
                    ),
                  ),
                ],
              ),
              Text(
                '登录后可以体验更多',
                style: loginMessageStyle,
              )
            ],
          )
        ],
      ),
    );
  }

  // ignore: unused_element
  Widget _loginBuilder(BuildContext context) {
    String userName = '已登录用户名';
    String userImage = 'static/images/login.jpg';
    return Container(
      padding: EdgeInsets.only(top: 10.0, left: 20.0, bottom: 20.0),
      decoration: BoxDecoration(
        color: Colors.blue,
      ),
      height: 95.0,
      child: Row(
        children: <Widget>[
          Container(
            height: 65.0,
            width: 65.0,
            margin: EdgeInsets.only(right: 15.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(userImage),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 6.0),
              ),
              Text(
                userName,
                style: loginStyle,
              ),
              Text(
                '查看编辑个人资料',
                style: loginMessageStyle,
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var isLogin = true;
    return isLogin ? _loginBuilder(context) : _notLoginBuilder(context);
  }
}
