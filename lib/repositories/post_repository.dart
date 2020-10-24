import 'package:flutter_blog/config/HttpRoutes.dart';
import 'package:flutter_blog/interfaces/ClientHttpInterface.dart';
import 'package:flutter_blog/models/post_model.dart';
import 'package:flutter_blog/stores/user/user_store.dart';
import 'package:get_it/get_it.dart';

class PostRepository {
    final _clientHttp = GetIt.I.get<IClientHttp>();
	final _userGlobal = GetIt.I.get<UserStore>();

    Future<bool> create({int idCategory, String title, description})async{
		bool response = await _clientHttp.request(
		  method: HttpMethods.post,
		  uri: HttpRoutes.postCreate,
		  data: {
			"usuario":{
			  "id":_userGlobal.user.id,
			},
			"dados_blog":{
			  "id_blog":1
			},
			"dados_categoria":{
			  "id_categoria": idCategory
			},
			"titulo":title,
			"assunto":description
		  }
		);

		if(response != null)
		  return true;

		return false;
	}
	
}