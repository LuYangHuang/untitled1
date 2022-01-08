import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonPicker {
  static Future<int?>? showPicker({
    required BuildContext context,
    required List<String> options,
    required int value,
    required double height, //半屏高度
  }) {
    return showCupertinoModalPopup<int>(
        context: context,
        builder: (BuildContext context) {
          var buttonTextStyle = TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w600);

          var scrollController =
              FixedExtentScrollController(initialItem: value);

          return Container(
            color: Colors.grey,
            height: height,
            child: Column(
              children: <Widget>[
                Container(
                  color: Colors.grey[200],
                  height: 40.0,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              '取消',
                              style: buttonTextStyle,
                            )),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pop(scrollController.selectedItem);
                            },
                            child: Text(
                              '确定',
                              style: buttonTextStyle,
                            )),
                      ]),
                ),
                Expanded(
                    child: CupertinoPicker(
                        scrollController: scrollController,
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        itemExtent: 32.0,
                        onSelectedItemChanged: (val) {},
                        children: options.map((item) => Text(item)).toList()))
              ],
            ),
          );
        });
  }
}
