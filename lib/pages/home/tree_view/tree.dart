import 'package:flutter/material.dart';
import 'package:untitled1/pages/home/tree_view/ImageText.dart';
import 'package:untitled1/pages/home/tree_view/node.dart';
import 'package:untitled1/pages/home/tree_view/organ.dart';

class Tree extends StatefulWidget {
  List<Organ> organs = [];
  Tree(this.organs, {Key? key}) : super(key: key);

  @override
  State<Tree> createState() => _TreeState();
}

class _TreeState extends State<Tree> {
  ///保存所有数据的List
  List<Node> list = [];

  ///保存当前展示数据的List
  List<Node> expand = [];

  ///保存List的下标的List，用来做标记用
  List<int> mark = [];

  ///第一个节点的index
  int nodeId = 1;

  ///展示搜索结构
  bool showSearch = false;
  late List<Node> keep;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    nodeId = 1;
    _parseOrgans(widget.organs);
    _addRoot();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Expanded(
                child: ListView(
              children: _bulidNode(expand),
            ))
          ],
        ),
      ),
    );
  }

  ///如果解析的数据是一个list列表，采用这个方法
  void _parseOrgans(List<Organ> organs) {
    for (Organ organ in organs) {
      _parseOrgan(organ);
    }
  }

  ///递归解析原始数据，将organ递归，记录其深度，nodeID和fatherID，将根节点的fatherID置为-1，
  ///保存原始数据为泛型T
  void _parseOrgan(Organ organ, {int depth = 0, int fatherId = -1}) {
    int currentId = nodeId;
    list.add(Node(false, depth, Node.typeOrgan, nodeId++, fatherId, organ));

    List<Node<Member>> members = [];
    if (organ.members != null) {
      for (Member member in organ.members!) {
        members.add(Node(
            false, depth + 1, Node.typeMember, nodeId++, currentId, member));
      }
    }
    list.addAll(members);
    if (organ.subOrgans != null) {
      for (Organ organ in organ.subOrgans!) {
        _parseOrgan(organ, depth: depth + 1, fatherId: currentId);
      }
    }
  }

  ///增加根
  void _addRoot() {
    for (Node node in list) {
      if (node.fatherId == -1) {
        expand.add(node);
      }
    }
  }

  List<Widget> _bulidNode(List<Node>? nodes) {
    List<Widget> widgets = [];
    if (nodes != null && nodes.length > 0) {
      for (Node node in nodes) {
        widgets.add(GestureDetector(
          child: ImageText(
            node.type == Node.typeOrgan
                ? node.expand
                    ? "static/images/expand.png"
                    : "static/images/collect.png"
                : "static/images/member.png",
            node.type == Node.typeOrgan
                ? (node.object as Organ).name
                : (node.object as Member).name,
            padding: showSearch ? 0 : node.depth * 20.0, //如果展示搜索结果，那么不缩进
          ),
          onTap: () {
            if (node.type == Node.typeOrgan) {
              if (node.expand) {
                //之前是扩展状态，收起列表
                node.expand = false;
                _collect(node.nodeId);
              } else {
                //之前是收起状态，扩展列表
                node.expand = true;
                _expand(node.nodeId);
              }
              setState(() {});
            }
          },
        ));
      }
    }
    return widgets;
  }

  void _collect(int id) {
    //清楚之前的标记
    mark.clear();
    //标记
    _mark(id);
    //重新对expand赋值
    List<Node> tmp = [];
    for (Node node in expand) {
      if (mark.indexOf(node.nodeId) < 0) {
        tmp.add(node);
      } else {
        node.expand = false;
      }
    }
    expand.clear();
    expand.addAll(tmp);
  }

  ///扩展机构树：id代表被点击的机构id
  /// 做法是遍历整个list列表，将直接挂在该机构下面的节点增加到一个临时列表中，
  ///然后将临时列表插入到被点击的机构下面
  void _expand(int id) {
    //保存到临时列表
    List<Node> tmp = [];
    for (Node node in list) {
      if (node.fatherId == id) {
        tmp.add(node);
      }
    }
    //找到插入点
    int index = -1;
    int length = expand.length;
    for (int i = 0; i < length; i++) {
      if (id == expand[i].nodeId) {
        index = i + 1;
        break;
      }
    }
    //插入
    expand.insertAll(index, tmp);
  }

  ///标记，在收起机构树的时候用到
  void _mark(int id) {
    for (Node node in expand) {
      if (id == node.fatherId) {
        if (node.type == Node.typeOrgan) {
          _mark(node.nodeId);
        }
        mark.add(node.nodeId);
      }
    }
  }
}
