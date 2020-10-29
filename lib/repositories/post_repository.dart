import 'package:flutter_blog/config/HttpRoutes.dart';
import 'package:flutter_blog/interfaces/ClientHttpInterface.dart';
import 'package:flutter_blog/models/post_model.dart';
import 'package:flutter_blog/stores/user/user_store.dart';
import 'package:get_it/get_it.dart';

class PostRepository{
  final _clientHttp = GetIt.I.get<IClientHttp>();
  final _user = GetIt.I.get<UserStore>();

  Future<bool> create({String title, description, int idCategory})async{
	bool response = await _clientHttp.request(
	  uri: HttpRoutes.postCreate,
	  method: HttpMethods.post,
	  data: {
		"usuario":{
		  "id":_user.user.id,
		},
		"dados_blog":{
		  "id_blog":1
		},
		"dados_categoria":{
		  "id_categoria":idCategory
		},
		"titulo": title,
		"assunto": description
	  }
	);

	if(response != null) return response;

	return false;
  }

  Future<List<PostModel>> getPosts()async{
	List<PostModel> listPost = List();
    List response = await _clientHttp.request(
		uri: HttpRoutes.getPosts,
	  	method: HttpMethods.post,
		data: {
		  "usuario":{
			"id":_user.user.id,
		  },
		}
	);

    if(response != null){
      for(Map<String, dynamic> post in response){
        listPost.add(PostModel.fromJson(post));
	  }

      return listPost;
	}

    return null;
  }

}