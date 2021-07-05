import 'package:flutter/material.dart';
import 'package:healtcare/Screens/Drawer/components/body.dart';

import '../../constants.dart';

class DrawerPage extends StatefulWidget {
  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "",
          style: TextStyle(
            color: blackColor,
          ),
        ),
        backgroundColor: whiteColor,
      ),
      body: Body(),
    );
  }
}
