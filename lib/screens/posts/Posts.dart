import 'package:flutter/material.dart';
import 'package:flutter_blog/screens/constants.dart';
import 'package:flutter_blog/screens/posts/components/body_component.dart';
import 'package:flutter_blog/screens/posts/components/bottom_navigation_bar.dart';
import 'package:flutter_blog/widgets/default_scaffold.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Posts extends StatefulWidget {
  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
	  appBarTitle: "Postagens",
	  action1: IconButton(
		icon: Icon(FontAwesomeIcons.plusCircle, size: 20, color: Colors.white,),
		onPressed: (){},
	  ),
	  body: BodyComponentPost(),
	  bottomNavigationBar: BottomNavigationBarComponent(),
	);
  }
}
