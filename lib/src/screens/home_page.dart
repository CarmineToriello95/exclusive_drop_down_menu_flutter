import 'package:flutter/material.dart';
import '../widgets/exclusive_drop_down_menu.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Exclusive Drop Down Menu'),
        ),
        body: Container(
          margin: EdgeInsets.all(20.0),
          child: ExclusiveDropDownMenu(),
        ));
  }
}
