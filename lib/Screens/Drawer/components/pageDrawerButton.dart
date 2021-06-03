import 'package:flutter/material.dart';

class PageDrawerBoutton extends StatelessWidget {
  final String titre;
  final Function press;
  final Color color;
  const PageDrawerBoutton({
    Key key,
    this.titre,
    this.press,
    this.color = Colors.black87,
  }) : super(key: key);

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
              style: TextStyle(
                fontSize: 18,
                color: color,
              ),
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
