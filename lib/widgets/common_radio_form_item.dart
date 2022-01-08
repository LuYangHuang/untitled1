import 'package:flutter/material.dart';
import 'package:untitled1/widgets/common_form_item.dart';

class CommonRadioFormItem extends StatelessWidget {
  final String label;
  final List<String> options;
  final int value;
  final ValueChanged<int?>? onChange;

  const CommonRadioFormItem(
      {Key? key,
      required this.label,
      required this.options,
      required this.value,
      this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonFormItem(
      label: label,
      contentBuild: (context) {
        return Container(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                  options.length,
                  (index) => Row(
                        children: <Widget>[
                          Radio(
                            value: value,
                            onChanged: onChange,
                            groupValue: 0,
                          ),
                          Text(options[index])
                        ],
                      )).toList()),
        );
      },
      suffix: Text(''),
    );
  }
}
