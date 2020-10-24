import 'package:flutter/material.dart';


enum InputType { text, password, email, number }
enum TypeColor { normal, transparent }

class DefaultInput extends StatelessWidget {
  final String text;
  final IconData prefixIcon;
  final String maskInputFormatter;
  final TextInputType textInputType;
  final TypeColor typeColor;
  static InputDecoration decoration;
  final TextAlign textAlign;
  final int maxLines, maxLength;
  final TextEditingController controller;
  final TextCapitalization textCapitalization;
  final fieldSubmitted;
  final Function onChanged;
  const DefaultInput({
	this.text,
	this.prefixIcon,
	this.maskInputFormatter,
	this.textInputType,
	@required this.typeColor,
	this.textAlign,
	this.maxLines,
	this.controller,
	this.textCapitalization,
	this.fieldSubmitted,
	this.onChanged, this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
	switch (typeColor) {
	  case TypeColor.normal:
		decoration = InputDecoration(
		  prefixIcon: prefixIcon == null
			  ? null
			  : Icon(prefixIcon, size: 18, color: Colors.grey),
		  hintText: maskInputFormatter != null ? maskInputFormatter : text,
		  filled: true,
		  fillColor:Colors.grey[300],
		  enabledBorder: OutlineInputBorder(
			borderSide: BorderSide(color: Colors.grey[300], width: 2),
		  ),
		  focusedBorder: OutlineInputBorder(
			borderSide: BorderSide(color: Colors.grey[300]),
		  ),
		);
		break;
	  case TypeColor.transparent:
		decoration = InputDecoration(
		  hintText: maskInputFormatter != null ? maskInputFormatter : text,
		  prefixIcon: prefixIcon == null
			  ? null
			  : Icon(prefixIcon, size: 18, color: Colors.grey),
		);
		break;
	}

	return TextFormField(
	  maxLength: maxLength,
	  onChanged: onChanged,
	  onFieldSubmitted: fieldSubmitted,
	  textCapitalization: textCapitalization,
	  controller: controller,
	  maxLines: maxLines,
	  style: Theme.of(context).textTheme.subtitle1,
	  keyboardType: textInputType,
	  cursorColor: Colors.grey,
	  textAlign: textAlign ?? TextAlign.start,
	  decoration: decoration,
	);
  }
}
