import 'package:flutter/material.dart';
import 'package:flutter_blog/config/AppRoutes.dart';
import 'package:flutter_blog/models/post_model.dart';
import 'package:flutter_blog/screens/posts/components/alert_dialog.dart';
import 'package:flutter_blog/screens/posts/components/body_post_component.dart';
import 'package:flutter_blog/widgets/default_scaffold.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Post extends StatefulWidget {
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {

  PostModel post;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    post = ModalRoute.of(context).settings.arguments;
  }
  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
	  leading: IconButton(
		icon: Icon(FontAwesomeIcons.arrowLeft, size: 20, color: Colors.white,),
		onPressed: (){
		  Navigator.of(context).pushReplacementNamed(AppRoutes.posts);
		},
	  ),
	  appBarTitle: "${post.titulo}",
	  body: BodyPostComponent(
		post: post,
	  ),
	);
  }
}
