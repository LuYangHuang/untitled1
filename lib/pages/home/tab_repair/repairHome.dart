import 'package:flutter/material.dart';
import 'package:untitled1/widgets/Common_select_form_item.dart';
import 'package:untitled1/widgets/common_form_item.dart';
import 'package:untitled1/widgets/common_radio_form_item.dart';

class RepairHome extends StatefulWidget {
  const RepairHome({Key? key}) : super(key: key);

  @override
  State<RepairHome> createState() => _RepairHomeState();
}

class _RepairHomeState extends State<RepairHome> {
  int rentType = 0;
  int operationsType = 0;
  int alarmType = 0;
  int wayType = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('点位报修'),
      ),
      body: ListView(
        children: <Widget>[
          CommonFormItem(
            label: '编码',
            suffix: Text(''),
            hinxText: '请输入编码',
            controller: controller(),
          ),
          CommonFormItem(
            label: '地域',
            contentBuild: (context) {
              return Container(
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  child: Container(
                    height: 40.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '请选择点位',
                          style:
                              TextStyle(fontSize: 16.0, color: Colors.black87),
                        ),
                        Icon(Icons.keyboard_arrow_right)
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed('search');
                  },
                ),
              );
            },
            suffix: Text(''),
          ),
          CommonRadioFormItem(
              label: '性别',
              options: ['男', '女'],
              value: rentType,
              onChange: (index) {
                setState(() {
                  rentType = index!;
                });
              }),
          CommonSelectFormItem(
              label: '运维巡检',
              value: operationsType,
              options: [
                'options1',
                'options2',
                'options3',
                'options4',
              ],
              onChange: (index) {
                setState(() {
                  operationsType = index;
                });
              }),
          CommonSelectFormItem(
              label: '故障类型',
              value: alarmType,
              options: [
                'options1',
                'options2',
                'options3',
                'options4',
              ],
              onChange: (index) {
                setState(() {
                  alarmType = index;
                });
              }),
          CommonSelectFormItem(
              label: '发现途径',
              value: wayType,
              options: [
                'options1',
                'options2',
                'options3',
                'options4',
              ],
              onChange: (index) {
                setState(() {
                  wayType = index;
                });
              }),
          CommonFormItem(
            label: '描述',
            suffix: Text(''),
            hinxText: '请对故障进行描述',
            controller: controller(),
          ),
          CommonSelectFormItem(
              label: '抄送人',
              value: wayType,
              options: [
                '张军',
                '张军',
                '张军',
                '张军',
              ],
              onChange: (index) {
                setState(() {
                  wayType = index;
                });
              }),
          CommonFormItem(
            label: '照片',
            suffix: Icon(Icons.camera_alt_rounded),
            hinxText: '请选择照片',
            controller: controller(),
          ),
        ],
      ),
    );
  }
}

controller() {}
