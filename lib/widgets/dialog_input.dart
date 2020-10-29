import 'package:flutter/material.dart';

import 'default_input.dart';


class DialogInput extends StatelessWidget {
  final int maxLength;
  final String textInput;
  final String label;
  final IconData prefixIcon;
  final TextInputType textInputType;
  final String maskInputFormatter;
  final TextAlign textAlignInput;
  final TextAlign textAlignLabel;
  final Function onChanged;
  final TextCapitalization textCapitalization;
  final TextEditingController controller;
  const DialogInput(
	  {Key key,
		this.label,
		this.prefixIcon,
		this.textInputType,
		this.maskInputFormatter,
		this.textAlignInput,
		this.textAlignLabel,
		this.textInput, this.onChanged, this.textCapitalization, this.maxLength, this.controller})
	  : super(key: key);

  @override
  Widget build(BuildContext context) {
	return Column(
	  mainAxisSize: MainAxisSize.min,
	  children: [
		Container(
		  width: double.infinity,
		  child: Text(
			label,
			style: Theme.of(context).textTheme.subtitle1,
			textAlign: textAlignLabel ?? TextAlign.start,
		  ),
		),
		SizedBox(
		  height: 10,
		),
		DefaultInput(
		  maxLength: maxLength,
		  textCapitalization: textCapitalization,
		  onChanged: onChanged,
		  typeColor: TypeColor.normal,
		  text: textInput,
		  prefixIcon: prefixIcon,
		  textAlign: textAlignInput,
		  maskInputFormatter: maskInputFormatter,
		  controller: controller,
		),
	  ],
	);
  }
}
