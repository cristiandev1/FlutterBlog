import 'package:flutter_blog/config/HttpRoutes.dart';
import 'package:flutter_blog/interfaces/ClientHttpInterface.dart';
import 'package:flutter_blog/models/user_global_model.dart';
import 'package:get_it/get_it.dart';

class LoginRepository{
  final _clientHttp = GetIt.I.get<IClientHttp>();


  Future<UserGlobalModel> login({String email, senha})async{
	UserGlobalModel user;
    Map<String, dynamic> response = await _clientHttp.request(
	  method: HttpMethods.post,
	  uri: HttpRoutes.login,
	  data: {
		"email": email,
		"senha": senha
	  }
	);

    if(response != null){
     return  user = UserGlobalModel.fromJson(response);
	}

    return null;
  }
}