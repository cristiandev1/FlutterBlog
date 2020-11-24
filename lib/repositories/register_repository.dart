import 'package:flutter_blog/config/HttpRoutes.dart';
import 'package:flutter_blog/interfaces/ClientHttpInterface.dart';
import 'package:get_it/get_it.dart';

class RegisterRepository{
  final _clientHttp = GetIt.I.get<IClientHttp>();

  Future<bool> register({Map<String,dynamic> data})async{
	bool response = await _clientHttp.request(
	  uri: HttpRoutes.register,
	  method: HttpMethods.post,
	  data: data
	);

	if(response){
	  return response;
	}

	return false;
  }
}