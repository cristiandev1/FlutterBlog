import 'package:flutter/material.dart';
import 'package:flutter_blog/screens/posts/components/alert_dialog.dart';
import 'package:flutter_blog/screens/posts/components/body_post_component.dart';
import 'package:flutter_blog/widgets/default_scaffold.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Post extends StatefulWidget {
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
	  leading: IconButton(
		icon: Icon(FontAwesomeIcons.arrowLeft, size: 20, color: Colors.white,),
		onPressed: (){},
	  ),
	  action1: true ? IconButton(
		icon: Icon(FontAwesomeIcons.edit, size: 20, color: Colors.white,),
		onPressed: ()async{
		  showDialog(
			context: context,
			builder: (BuildContext context){
			  return AlertDialogComponent(
				title: "Editar Item",
			  );
			}
		  );
		},
	  ) : null,
	  appBarTitle: "Titulo da Postagem",
	  body: BodyPostComponent(),
	);
  }
}
