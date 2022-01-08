import 'package:flutter/material.dart';
import 'package:untitled1/pages/home/tab_profile/function_button_data.dart';
import 'package:untitled1/pages/home/tab_profile/function_button_widget.dart';

class FuctionButton extends StatelessWidget {
  const FuctionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        // spacing: ,
        runSpacing: 2.0,
        children: list.map((item) => FunctionButtonWidget(item)).toList(),
      ),
    );
  }
}
