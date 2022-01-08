import 'package:flutter/material.dart';

class PointPage extends StatefulWidget {
  const PointPage({Key? key}) : super(key: key);

  @override
  State<PointPage> createState() => _PointPageState();
}

class _PointPageState extends State<PointPage> {
  var childList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('点位勘点'),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                      width: 70,
                      height: 70,
                      // color: Colors.red,
                      child: IconButton(
                          onPressed: () {
                            print("你点击了拍照Icon");
                          },
                          icon: Icon(
                            Icons.camera_alt,
                            size: 35,
                          ))),
                  Container(
                    width: 230,
                    height: 50,
                    child: TextField(
                        obscureText: false,
                        strutStyle: StrutStyle(fontWeight: FontWeight.w400),
                        decoration: InputDecoration(
                            hintMaxLines: 30,
                            suffixIcon: Icon(Icons.search),
                            hintText: '请输入点位信息',
                            // hintStyle: TextStyle(
                            //     fontSize: 18.0, color: Colors.blue), //输入文本的样式
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2.0),
                              // borderSide: BorderSide(width: 300)
                            ))),
                  ),
                  Container(
                      width: 70,
                      height: 70,
                      child: TextButton(onPressed: () {}, child: Text('地图'))),
                ],
              ),
              Column(
                children: <Widget>[],
              )
            ],
          ),
        ));
  }
}
