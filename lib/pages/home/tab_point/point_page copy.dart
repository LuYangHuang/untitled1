import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:untitled1/pages/home/tree_view/organ.dart';
import 'package:untitled1/pages/home/tree_view/tree.dart';
import 'package:untitled1/widgets/search_bar/index.dart';
import 'dart:async';
import 'dart:math';

class PointPage22 extends StatefulWidget {
  const PointPage22({Key? key}) : super(key: key);

  @override
  State<PointPage22> createState() => _PointPage22State();
}

class _PointPage22State extends State<PointPage22> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();

  static int refreshNum = 10; // number that changes when refreshed
  Stream<int> counterStream =
      Stream<int>.periodic(Duration(seconds: 3), (x) => refreshNum);

  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = new ScrollController();
  }

  Future<void> _handleRefresh() {
    final Completer<void> completer = Completer<void>();
    Timer(const Duration(seconds: 3), () {
      completer.complete();
    });
    setState(() {
      refreshNum = new Random().nextInt(100);
    });
    print('you click this fresh');
    return completer.future.then<void>((_) {
      _scaffoldKey.currentState?.showSnackBar(SnackBar(
          content: const Text('Refresh complete'),
          action: SnackBarAction(
              label: 'RETRY',
              onPressed: () {
                _refreshIndicatorKey.currentState!.show();
              })));
    });
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
      body:
          // Tree(_buildData()),
          LiquidPullToRefresh(
        key: _refreshIndicatorKey,
        onRefresh: _handleRefresh,
        showChildOpacityTransition: false,
        child: StreamBuilder<int>(
            stream: counterStream,
            builder: (context, snapshot) {
              return Tree(_buildData());
            }),
      ),
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
