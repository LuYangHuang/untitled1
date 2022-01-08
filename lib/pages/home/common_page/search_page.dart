import 'package:flutter/material.dart';
import 'package:untitled1/pages/home/common_page/search_bar.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          SearchBar(
              enabled: true,
              hideLeft: true,
              hint: '123',
              defaultText: 'haha',
              searchBarType: SearchBarType.normal,
              leftButtionClick: () {
                Navigator.pop(context);
              },
              rightButtionClick: _rightButtionClick,
              speakClick: () {},
              inputBoxClick: _inputBoxClick,
              onChange: _onTextChage)
        ],
      ),
    );
  }

  _onTextChage(String value) {}

  _rightButtionClick() {}

  _inputBoxClick() {}
}
