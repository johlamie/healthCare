import 'package:flutter/material.dart';
import 'package:healtcare/components/text_field_container.dart';
import 'package:healtcare/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFiledContainer(
      child: TextFormField(
        obscureText: true,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: "Mot de passe",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: kPrimaryColor,
          ),
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
