import 'package:flutter/material.dart';

class Document {
  late final String name;
  late final Icon icon;
  late final bool isChildren;

  late Document childData;
  Document(
    this.name,
    this.icon,
    this.isChildren,
    this.childData,
  );
}
