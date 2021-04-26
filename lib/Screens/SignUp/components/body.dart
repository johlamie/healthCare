import 'dart:html';

import 'package:flutter/material.dart';
import 'package:healtcare/Screens/SignUp/components/background.dart';

class Body extends StatelessWidget {
  @override
  final Widget child;

  const Body({
    Key key,
    @required this.child,
  }) : super(key: key);
  Widget build(BuildContext context) {
    return Backgroud(
      child: Column(
        children: <Widget>[],
      ),
    );
  }
}
