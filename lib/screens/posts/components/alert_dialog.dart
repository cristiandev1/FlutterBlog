import 'package:flutter/material.dart';
import 'package:flutter_blog/screens/constants.dart';
import 'package:get/get.dart';

class AlertDialogComponent extends StatelessWidget {
  final String title;
  final Function onPressed;
  final Widget content;

  const AlertDialogComponent({Key key, this.title = '', this.onPressed, this.content}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
	  title: Text(title),
	  content: Text('formulário pra editar...'),
	  actions: [
		FlatButton(
		  textColor: kPrimaryColor,
		  onPressed: () {},
		  child: Text('CANCELAR'),
		),
		FlatButton(
		  textColor: kPrimaryColor,
		  onPressed: () {},
		  child: Text('ACEITAR'),
		),
	  ],
	);
  }
}
