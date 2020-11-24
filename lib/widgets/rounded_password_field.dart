import 'package:flutter/material.dart';
import 'package:flutter_blog/screens/constants.dart';
import 'package:flutter_blog/widgets/text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  const RoundedPasswordField({
	Key key,
	this.onChanged, this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
	return TextFieldContainer(
	  child: TextFormField(
		validator: (value){
		  if(value.isEmpty){
			return 'Campo obrigatório';
		  }
		},
		controller: controller,
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
