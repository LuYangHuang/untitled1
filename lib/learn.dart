import 'package:flutter/material.dart';

import 'routes.dart';

class learn extends StatelessWidget {
  final String name;
  const learn({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('当前页面:$name'),
        centerTitle: true,
      ),
      body: ListView(children: <Widget>[
        TextButton(
          child: Text(Routes.home),
          onPressed: () {
            Navigator.pushNamed(context, Routes.home);
          },
        ),
        TextButton(
          child: Text(Routes.login),
          onPressed: () {
            Navigator.pushNamed(context, Routes.login);
          },
        ),
        TextButton(
          child: Text('不存在的页面'),
          onPressed: () {
            Navigator.pushNamed(context, '/aaa');
          },
        ),
        TextButton(
          child: Text('房屋详情，id:2222'),
          onPressed: () {
            Navigator.pushNamed(context, '/room/2222');
          },
        ),
      ]),
    );
  }
}
