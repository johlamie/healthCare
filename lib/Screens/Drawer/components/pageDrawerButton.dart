import 'package:flutter/material.dart';

class PageDrawerBoutton extends StatelessWidget {
  const PageDrawerBoutton({
    Key key,
    this.titre,
    this.press,
  }) : super(key: key);
  final String titre;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Row(
          children: <Widget>[
            // SvgPicture.asset(),
            SizedBox(width: 10),
            Text(
              titre,
              style: TextStyle(fontSize: 18),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size: 18,
            )
          ],
        ),
      ),
    );
  }
}
