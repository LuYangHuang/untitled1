class FutionButtonItem {
  final String? imageUri = null;
  final String title;
  final Function? onTapHandle = null;

  FutionButtonItem(String? imageUri, this.title, Function? onTapHandle);
}

final List<FutionButtonItem> list = [
  FutionButtonItem('', '用户管理', null),
  FutionButtonItem('', '地区管理', null),
  FutionButtonItem('', '点位管理', null),
];
