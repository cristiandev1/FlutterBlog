import 'package:flutter/material.dart';
import 'package:flutter_blog/config/AppConfig.dart';
import 'package:flutter_blog/config/AppRoutes.dart';
import 'package:flutter_blog/stores/post/post_store.dart';
import 'package:flutter_blog/stores/user/user_store.dart';
import 'package:flutter_blog/widgets/default_input.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class BodyComponentPost extends StatefulWidget {
  @override
  _BodyComponentPostState createState() => _BodyComponentPostState();
}

class _BodyComponentPostState extends State<BodyComponentPost> {

  final _postStore = GetIt.I.get<PostStore>();
  final _user = GetIt.I.get<UserStore>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _postStore.controllerSearch.addListener(() {
      _postStore.searchPost();
	});
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
	  child: Column(
		mainAxisSize: MainAxisSize.min,
		children: [
		  DefaultInput(
			controller: _postStore.controllerSearch,
			typeColor: TypeColor.normal,
			prefixIcon: FontAwesomeIcons.search,
			textCapitalization: TextCapitalization.none,
			text: "Pesquisar",
		  ),
		  SizedBox(height: 10,),
		  Observer(
			builder: (_){
			  return ListView.builder(
				shrinkWrap: true,
				physics: NeverScrollableScrollPhysics(),
				itemCount:	_postStore.postsFiltered.length,
				itemBuilder: (_,index){
				  return InkWell(
					child: Card(
					  clipBehavior: Clip.antiAlias,
					  child: Column(
						mainAxisSize: MainAxisSize.min,
						children: <Widget>[

						  ListTile(
							//leading: Icon(FontAwesomeIcons.info, size: 50,),
							title: Text('${_postStore.postsFiltered[index].titulo}', style: TextStyle(fontSize: 20),),
							subtitle: Text('${_postStore.postsFiltered[index].assunto}', style: TextStyle(fontSize: 16),),
						  ),
						  Row(
							mainAxisAlignment: MainAxisAlignment.end,
							children: <Widget>[
							  FlatButton(
								child: const Text('DETALHES'),
								onPressed: () {
								  Navigator.of(context).pushReplacementNamed(AppRoutes.post, arguments: _postStore.postsFiltered[index]);
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
