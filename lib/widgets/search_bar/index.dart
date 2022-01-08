import 'dart:developer';

import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  //11
  final bool? showLocation; //展示按钮位置
  final Function? goBackCallBack; //回退函数按钮
  final String inputValue; //搜索框输入值
  final String defaultInputValue; //搜索框默认值
  final Function? onCanCel; //取消按钮
  final bool? showMap; //地图按钮展示
  final Function OnSearch; //用户点击搜索触发
  final ValueChanged<String>? onSearchSubmit; //用户输入搜索词后，点击
  const SearchBar({
    Key? key,
    this.showLocation = true,
    required this.goBackCallBack,
    this.inputValue = '',
    this.defaultInputValue = '请输入点位名称',
    required this.onCanCel,
    this.showMap = true,
    required this.OnSearch,
    required this.onSearchSubmit,
  }) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  // ignore: unused_field
  String _searchWord = '';
  TextEditingController _controller = TextEditingController(text: '');
  FocusNode _focus = FocusNode();
  Function? _onClean() {
    _controller.clear();
    setState(() {
      _searchWord = '';
    });
    return null;
  }

  @override
  void initState() {
    // _focus = FocusNode();
    _controller = TextEditingController(text: widget.inputValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: <Widget>[
        if (widget.showLocation != null)
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              onTap: () {},
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.room,
                    color: Colors.green,
                    size: 16.0,
                  ),
                  Text(
                    '福州',
                    style: TextStyle(color: Colors.black, fontSize: 13.0),
                  )
                ],
              ),
            ),
          ),
        if (widget.goBackCallBack != null)
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              onTap: widget.goBackCallBack!(),
              child: Icon(Icons.chevron_left, color: Colors.black12),
            ),
          ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17.0),
                color: Colors.grey[200]),
            height: 34.0,
            padding: EdgeInsets.only(right: 10.0),
            child: TextField(
              focusNode: _focus, //焦点问题  待解决
              onTap: () {
                if (null == widget.onSearchSubmit) {
                  _focus.unfocus();
                }
                widget.OnSearch();
              },
              onSubmitted: widget.onSearchSubmit,
              textInputAction: TextInputAction.search,
              controller: _controller,
              style: TextStyle(fontSize: 14.0),
              onChanged: (String value) {
                setState(() {
                  _searchWord = value;
                });
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.defaultInputValue,
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14.0),
                contentPadding: EdgeInsets.only(top: 0.3),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(top: 0.3),
                  child: Icon(
                    Icons.search,
                    size: 18.0,
                    color: Colors.grey,
                  ),
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    log('message');
                    _onClean();
                  },
                  child: Icon(
                    Icons.clear,
                    size: 18.0,
                    color: _searchWord == '' ? Colors.grey[200] : Colors.black,
                  ),
                ),
              ),
            ),
          ),
        )),
        if (widget.onCanCel != null)
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: GestureDetector(
                onTap: widget.onCanCel!(),
                child: Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Text(
                    '取消',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                )),
          ),
        if (widget.showMap != null)
          Icon(
            Icons.maps_home_work_sharp,
            color: Colors.black,
          )
        // Image.asset('static/images/supwit.png')
      ],
    ));
  }
}
