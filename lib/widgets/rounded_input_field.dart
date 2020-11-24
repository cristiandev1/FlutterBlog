import 'package:flutter/material.dart';
import 'package:flutter_blog/screens/constants.dart';
import 'package:flutter_blog/widgets/text_field_container.dart';


class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
	Key key,
	this.hintText,
	this.icon = Icons.person,
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
		onChanged: onChanged,
		cursorColor: kPrimaryColor,
		decoration: InputDecoration(
		  icon: Icon(
			icon,
			color: kPrimaryColor,
		  ),
		  hintText: hintText,
		  border: InputBorder.none,
		),
	  ),
	);
  }
}
