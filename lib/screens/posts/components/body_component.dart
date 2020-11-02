import 'package:flutter/material.dart';
import 'package:flutter_blog/config/AppConfig.dart';
import 'package:flutter_blog/config/AppRoutes.dart';
import 'package:flutter_blog/stores/user/user_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class BodyComponentPost extends StatefulWidget {
  @override
  _BodyComponentPostState createState() => _BodyComponentPostState();
}

class _BodyComponentPostState extends State<BodyComponentPost> {

  final _user = GetIt.I.get<UserStore>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
	  child: Column(
		mainAxisSize: MainAxisSize.min,
		children: [
		  Observer(
			builder: (_){
			  return ListView.builder(
				shrinkWrap: true,
				physics: NeverScrollableScrollPhysics(),
				itemCount: _user.user.postagens.length,
				itemBuilder: (_,index){
				  return InkWell(
					child: Card(
					  clipBehavior: Clip.antiAlias,
					  child: Column(
						mainAxisSize: MainAxisSize.min,
						children: <Widget>[

						  ListTile(
							//leading: Icon(FontAwesomeIcons.info, size: 50,),
							title: Text('${_user.user.postagens[index].titulo}', style: TextStyle(fontSize: 20),),
							subtitle: Text('${_user.user.postagens[index].assunto}', style: TextStyle(fontSize: 16),),
						  ),
						  Row(
							mainAxisAlignment: MainAxisAlignment.end,
							children: <Widget>[
							  FlatButton(
								child: const Text('DETALHES'),
								onPressed: () {
								  Future.delayed(Duration(seconds: 2),(){
									Navigator.of(context).pushReplacementNamed(AppRoutes.post, arguments: _user.user.postagens[index]);
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
				  );
				},
			  );
			},
		  ),
		],
	  ),
	);
  }
}
