import 'package:flutter/material.dart';

class IndexNavigatorItem {
  late final String title;
  final String imageUri;
  final Function(BuildContext context) ontap;
  IndexNavigatorItem(this.title, this.imageUri, this.ontap);
}

List<IndexNavigatorItem> navigatorItemList = [
  IndexNavigatorItem('新报修', 'static/images/supwit.png', (BuildContext context) {
    Navigator.of(context).pushReplacementNamed('login');
  }),
  IndexNavigatorItem('待报修', 'static/images/supwit.png', (BuildContext context) {
    Navigator.of(context).pushReplacementNamed('login');
  }),
  IndexNavigatorItem('已修好', 'static/images/supwit.png', (BuildContext context) {
    Navigator.of(context).pushReplacementNamed('login');
  }),
];
