import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_blog/screens/constants.dart';

class DefaultScaffold extends StatefulWidget {
  final String appBarTitle;
  final Widget body, bottomNavigationBar, floatingActionButton, leading;
  final IconButton action1, action2, action3;

  const DefaultScaffold({Key key, this.appBarTitle = '', this.body, this.bottomNavigationBar, this.floatingActionButton, this.action1, this.action2, this.action3, this.leading}) : super(key: key);
  @override
  _DefaultScaffoldState createState() => _DefaultScaffoldState();
}

class _DefaultScaffoldState extends State<DefaultScaffold> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
	  key: scaffoldKey,
	  appBar: AppBar(
		leading: widget.leading ?? widget.leading,
		backgroundColor: kPrimaryColor,
		automaticallyImplyLeading: Platform.isIOS,
		title: Text(widget.appBarTitle, style: TextStyle(fontSize: 20),),
		centerTitle: true,
		actions: [
		  if (widget.action1 != null) widget.action1,
		  if (widget.action2 != null) widget.action2,
		  if (widget.action3 != null) widget.action3,
		],
	  ),
	  bottomNavigationBar: widget.bottomNavigationBar ?? widget.bottomNavigationBar,
	  body: widget.body,
	);
  }
}
