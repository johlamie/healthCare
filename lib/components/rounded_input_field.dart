import 'package:flutter/material.dart';
import 'package:healtcare/components/text_field_container.dart';
import 'package:healtcare/constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFiledContainer(
      child: TextFormField(
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return "Champ Obligatoire";
          }
          return null;
        },
      ),
    );
  }
}
