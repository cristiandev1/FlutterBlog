import 'package:flutter/material.dart';
import 'package:flutter_blog/config/AppConfig.dart';
import 'package:flutter_blog/config/AppRoutes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BodyComponentPost extends StatefulWidget {
  @override
  _BodyComponentPostState createState() => _BodyComponentPostState();
}

class _BodyComponentPostState extends State<BodyComponentPost> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
	  child: Column(
		children: [
		  InkWell(
			child: Card(
			  clipBehavior: Clip.antiAlias,
			  child: Column(
				mainAxisSize: MainAxisSize.min,
				children: <Widget>[

				  const ListTile(
					//leading: Icon(FontAwesomeIcons.info, size: 50,),
					title: Text('Titulo Teste Publicação', style: TextStyle(fontSize: 20),),
					subtitle: Text('Conteúdo da publicação', style: TextStyle(fontSize: 16),),
				  ),
				  Row(
					mainAxisAlignment: MainAxisAlignment.end,
					children: <Widget>[
					  FlatButton(
					  child: const Text('DETALHES'),
					  onPressed: () {
						Future.delayed(Duration(seconds: 3),(){
						  Navigator.of(context).pushReplacementNamed(AppRoutes.post);
						});
					  },
					  ),
					  const SizedBox(width: 8),
					],
				  ),
				],
			  ),
			),
			onTap: (){},
		  ),
		  InkWell(
			child: Card(
			  clipBehavior: Clip.antiAlias,
			  child: Column(
				mainAxisSize: MainAxisSize.min,
				children: <Widget>[

				  const ListTile(
					//leading: Icon(FontAwesomeIcons.info, size: 50,),
					title: Text('Titulo Teste Publicação', style: TextStyle(fontSize: 20),),
					subtitle: Text('Conteúdo da publicação', style: TextStyle(fontSize: 16),),
				  ),
				  Row(
					mainAxisAlignment: MainAxisAlignment.end,
					children: <Widget>[
					  FlatButton(
						child: const Text('DETALHES'),
						onPressed: () { /* ... */ },
					  ),
					  const SizedBox(width: 8),
					],
				  ),
				],
			  ),
			),
			onTap: (){},
		  ),
		],
	  ),
	);
  }
}
