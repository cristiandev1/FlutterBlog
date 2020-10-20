import 'package:flutter/material.dart';
import 'package:flutter_blog/screens/constants.dart';
import 'package:flutter_blog/screens/posts/components/body_component.dart';
import 'package:flutter_blog/screens/posts/components/bottom_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Posts extends StatefulWidget {
  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
	  appBar: AppBar(
		actions: [
		  IconButton(
			icon: Icon(
			  FontAwesomeIcons.plusCircle,
			  size: 22,
			  color: Colors.white,
			),
			onPressed: (){

			},
		  ),
		],
		centerTitle: true,
		backgroundColor: kPrimaryColor,
		title: Text('Postagens'),
	  ),
	  body: BodyComponentPost(),
	  bottomNavigationBar: BottomNavigationBarComponent(),
	);
  }
}
