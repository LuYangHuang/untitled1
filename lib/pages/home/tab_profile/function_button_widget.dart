import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:untitled1/pages/home/tab_profile/function_button_data.dart';

class FunctionButtonWidget extends StatelessWidget {
  final FutionButtonItem data;
  const FunctionButtonWidget(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        log('你点击了');
        if (null != data.onTapHandle) {
          data.onTapHandle!(context);
        }
      },
      child: Container(
        margin: EdgeInsets.only(top: 30.0),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[Text(data.title)],
        ),
      ),
    );
  }
}
