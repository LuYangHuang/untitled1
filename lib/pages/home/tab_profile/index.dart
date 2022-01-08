import 'package:flutter/material.dart';
import 'package:untitled1/pages/home/tab_profile/function_buttin.dart';
import 'package:untitled1/pages/home/tab_profile/header.dart';

var textInfoStyte = TextStyle(color: Colors.black, fontSize: 20.0);

class TabProFile extends StatelessWidget {
  final String name = '我的';
  const TabProFile({Key? key, String? name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('$name'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('setting');
              },
              icon: Icon(Icons.settings))
        ],
      ),
      body: ListView(
        children: <Widget>[
          Header(),
          FuctionButton(),
        ],
      ),
    );
  }
}
