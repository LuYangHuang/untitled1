import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:untitled1/pages/home/tree_view/organ.dart';
import 'package:untitled1/pages/home/tree_view/tree.dart';
import 'package:untitled1/widgets/search_bar/index.dart';
import 'dart:async';

class PointPage2 extends StatefulWidget {
  const PointPage2({Key? key}) : super(key: key);

  @override
  State<PointPage2> createState() => _PointPage2State();
}

class _PointPage2State extends State<PointPage2> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: true);

  void _onRefresh() async {
    print('you click reFresh');
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    // items.add((items.length + 1).toString());
    print('you click loading');
    if (mounted) setState(() {});
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SearchBar(
          onCanCel: () {},
          OnSearch: () {},
          goBackCallBack: () {},
          onSearchSubmit: onSearchSubmit,
        ),
        backgroundColor: Colors.white,
      ),
      body: SmartRefresher(
          enablePullDown: true,
          enablePullUp: true,
          header: WaterDropHeader(),
          footer:
              CustomFooter(builder: (BuildContext context, LoadStatus? mode) {
            Widget body;
            if (mode == LoadStatus.idle) {
              body = Text("pull up load");
            } else if (mode == LoadStatus.loading) {
              body = CupertinoActivityIndicator();
            } else if (mode == LoadStatus.failed) {
              body = Text("Load Failed!Click retry!");
            } else if (mode == LoadStatus.canLoading) {
              body = Text("release to load more");
            } else {
              body = Text("No more Data");
            }
            return Container(
              height: 55.0,
              child: Center(child: body),
            );
          }),
          controller: _refreshController,
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          child: Tree(_buildData())),
    );
  }

  void onSearchSubmit(String value) {}

  List<Organ> _buildData() {
    return [
      Organ([
        Organ([
          Organ([
            Organ([
              Organ(
                  null,
                  [
                    Member("五级地区点位1"),
                    Member("五级地区点位2"),
                    Member("五级地区点位3"),
                    Member("五级地区点位4"),
                  ],
                  "五级地区")
            ], [
              Member("四级地区点位1"),
              Member("四级地区点位2"),
              Member("四级地区点位3"),
              Member("四级地区点位4"),
            ], "四级地区"),
            Organ([
              Organ(
                  null,
                  [
                    Member("六级地区点位1"),
                    Member("六级地区点位2"),
                    Member("六级地区点位3"),
                    Member("六级地区点位4"),
                  ],
                  "六级地区")
            ], [
              Member("七级地区点位1"),
              Member("七级地区点位2"),
              Member("七级地区点位3"),
              Member("七级地区点位4"),
            ], "七级地区")
          ], [
            Member("三级地区点位1"),
            Member("三级地区点位2"),
            Member("三级地区点位3"),
            Member("三级地区点位4"),
          ], "三级地区")
        ], [
          Member("二级地区点位1"),
          Member("二级地区点位2"),
          Member("二级地区点位3"),
        ], "二级地区")
      ], [
        Member("一级地区点位1"),
        Member("一级地区点位2"),
        Member("一级地区点位3"),
        Member("一级地区点位4"),
        Member("一级地区点位5"),
      ], "一级地区"),
      Organ(
          null,
          [
            Member("八级地区点位1"),
            Member("八级地区点位2"),
            Member("八级地区点位3"),
            Member("八级地区点位4"),
            Member("八级地区点位5"),
          ],
          "八级地区")
    ];
  }
}
