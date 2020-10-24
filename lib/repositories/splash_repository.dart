import 'package:flutter_blog/config/HttpRoutes.dart';
import 'package:flutter_blog/interfaces/ClientHttpInterface.dart';
import 'package:flutter_blog/models/user_global_model.dart';
import 'package:get_it/get_it.dart';

class SplashRepository{
  final _clientHttp = GetIt.I.get<IClientHttp>();

  Future<UserGlobalModel> splash({int idUser})async{
    UserGlobalModel user;
    Map<String, dynamic> response = await _clientHttp.request(
	  uri: HttpRoutes.splash,
	  method: HttpMethods.post,
	  data: {
		"usuario":{
		  "id": idUser
		}
	  }
	);

    if(response != null){
	  user = UserGlobalModel.fromJson(response);
	  return user;
	}

    return null;
  }
}