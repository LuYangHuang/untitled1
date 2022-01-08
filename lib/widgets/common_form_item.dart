import 'package:flutter/material.dart';

class CommonFormItem extends StatelessWidget {
  final String label;
  final Widget Function(BuildContext context)? contentBuild;

  final Widget suffix;
  final String? suffixText;

  final String? hinxText;
  final ValueChanged? onChaned;
  final TextEditingController? controller;

  const CommonFormItem(
      {Key? key,
      required this.label,
      this.contentBuild,
      required this.suffix,
      this.suffixText,
      this.hinxText,
      this.onChaned,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Text('data');
    return Container(
      padding: EdgeInsets.only(left: 14.0, right: 14.0),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: 1.0, color: Theme.of(context).dividerColor))),
      child: Row(
        children: <Widget>[
          Container(
            width: 100.0,
            child: Text(
              label,
              style: TextStyle(fontSize: 16.0, color: Colors.black87),
            ),
          ),
          Expanded(
              child: contentBuild != null
                  ? contentBuild!(context)
                  : TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: hinxText,
                      ),
                    )),
          suffix
        ],
      ),
    );
  }
}
