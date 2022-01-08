import 'package:flutter/material.dart';
// import 'package:untitled1/widgets/common_swipper.dart';

import 'index_navigator.dart';

class TabIndex extends StatelessWidget {
  const TabIndex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('tabIndex'),
      ),
      body: ListView(
        children: <Widget>[
          IndexNacigator(),
          Text('这里是内容区域'),
        ],
      ),
    );
  }
}
