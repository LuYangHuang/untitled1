import 'package:flutter/material.dart';
import 'package:untitled1/pages/home/tab_index/index.dart';
import 'package:untitled1/pages/home/tab_point/point_page.dart';
import 'package:untitled1/pages/home/tab_profile/index.dart';
import 'package:untitled1/pages/home/tab_repair/repairHome.dart';

//1.准备4个 tab内容区
List<Widget> tabViewList = [
  // learn(name: '点位勘点'),
  // PointPage(),
  // MyHomePage(),
  // ListViewPage(),
  PointPage2(),
  RepairHome(),
  // learn(name: '报修'),

  TabIndex(),
  // SearchPage(),
  TabProFile(name: '我的'),
];

//准备4个bottomNavigationBarItem

List<BottomNavigationBarItem> barItemList = [
  BottomNavigationBarItem(label: '勘点', icon: Icon(Icons.home)),
  BottomNavigationBarItem(label: '报修', icon: Icon(Icons.search)),
  BottomNavigationBarItem(label: '看板', icon: Icon(Icons.info)),
  BottomNavigationBarItem(
      label: '我的', icon: Icon(Icons.account_balance_rounded)),
];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabViewList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: barItemList,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }
}
