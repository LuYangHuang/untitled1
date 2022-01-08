import 'package:flutter/material.dart';

enum SearchBarType { home, normal, homeLight }

class SearchBar extends StatefulWidget {
  final bool enabled; //是否禁止搜索
  final bool hideLeft; //左边按钮是否隐藏
  final SearchBarType searchBarType; //枚举
  final String hint; //默认提示文
  final String defaultText; //默认搜索提示文
  final void Function() leftButtionClick;
  final void Function() rightButtionClick;
  final void Function() speakClick;
  final void Function() inputBoxClick;
  final ValueChanged<String> onChange;

  const SearchBar(
      {Key? key,
      required this.enabled,
      required this.hideLeft,
      required this.hint,
      required this.defaultText,
      required this.searchBarType,
      required this.leftButtionClick,
      required this.rightButtionClick,
      required this.speakClick,
      required this.inputBoxClick,
      required this.onChange})
      : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool showClear = false;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    // ignore: unnecessary_null_comparison
    if (widget.defaultText != null) {
      setState(() {
        _controller.text = widget.defaultText;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.searchBarType == SearchBarType.normal
        ? _genNormalSearch()
        : _genHomeSerach();
  }

  _onChanged(String text) {
    if (text.length > 0) {
      setState(() {
        showClear = true;
      });
    } else {
      setState(() {
        showClear = false;
      });
    }
    // ignore: unnecessary_null_comparison
    if (widget.onChange != null) {
      widget.onChange(text);
    }
  }

  _genNormalSearch() {
    return Container(
      child: Row(children: <Widget>[
        _wrapTap(
            Container(
              child: Icon(
                Icons.arrow_back_rounded,
                color: Colors.grey,
                size: 26,
              ),
            ),
            widget.leftButtionClick),
        Expanded(
          flex: 1,
          child: _inputBox(),
        ),
        _wrapTap(
            Container(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Text(
                '搜索',
                style: TextStyle(color: Colors.blue, fontSize: 17),
              ),
            ),
            widget.rightButtionClick)
      ]),
    );
  }

  _genHomeSerach() {
    return Container(
      child: Row(children: <Widget>[
        _wrapTap(
            Container(
                padding: EdgeInsets.fromLTRB(6, 5, 5, 5),
                child: Row(
                  children: <Widget>[
                    Text(
                      '福州',
                      style: TextStyle(color: _homeFontColor(), fontSize: 14),
                    ),
                    Icon(
                      Icons.expand_more,
                      color: _homeFontColor(),
                      size: 22,
                    )
                  ],
                )),
            widget.leftButtionClick),
        Expanded(
          flex: 1,
          child: _inputBox(),
        ),
        _wrapTap(
            Container(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Text(
                '搜索',
                style: TextStyle(color: Colors.blue, fontSize: 17),
              ),
            ),
            widget.rightButtionClick)
      ]),
    );
  }

  _wrapTap(Widget child, void Function()? callback) {
    return GestureDetector(
      onTap: () {
        if (callback != null) {
          callback();
        }
      },
      child: child,
    );
  }

  _inputBox() {
    if (widget.searchBarType == SearchBarType.home) {
    } else {}
    return Container(
      child: Row(
        children: <Widget>[
          Icon(
            Icons.search,
            size: 20,
            color: widget.searchBarType == SearchBarType.normal
                ? Color(0xffA9A9)
                : Colors.blue,
          ),
          Expanded(
              flex: 1,
              child: widget.searchBarType == SearchBarType.normal
                  ? TextField(
                      controller: _controller,
                      onChanged: _onChanged,
                      autofocus: true,
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w300),
                      //输入文本的样式
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        border: InputBorder.none,
                        hintText: widget.hint,
                        hintStyle: TextStyle(fontSize: 15),
                      ),
                    )
                  : _wrapTap(
                      Container(
                        child: Text(
                          widget.defaultText,
                          style: TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                      ),
                      widget.inputBoxClick)),
        ],
      ),
    );
  }

  _homeFontColor() {
    return widget.searchBarType == SearchBarType.homeLight
        ? Colors.black54
        : Colors.white;
  }
}
