import 'package:flutter/material.dart';
// ignore: unused_import
import './index_NavigatorItem.dart';

class IndexNacigator extends StatelessWidget {
  const IndexNacigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
          children: navigatorItemList
              .map((item) => InkWell(
                    onTap: () {
                      item.ontap(context);
                    },
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          item.imageUri,
                          width: 135,
                        ),
                        Text(item.title)
                      ],
                    ),
                  ))
              .toList()),
    );
  }
}
