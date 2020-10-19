import 'package:flutter/material.dart';
import 'package:flutter_blog/screens/constants.dart';
import 'package:flutter_blog/widgets/text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
	Key key,
	this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
	return TextFieldContainer(
	  child: TextField(
		obscureText: true,
		onChanged: onChanged,
		cursorColor: kPrimaryColor,
		decoration: InputDecoration(
		  hintText: "Digite sua Senha",
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
	  ),
	);
  }
}
