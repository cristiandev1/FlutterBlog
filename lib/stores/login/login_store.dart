import 'package:flutter_blog/config/HttpRoutes.dart';
import 'package:flutter_blog/interfaces/ClientHttpInterface.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store{

  final _clientHttp = GetIt.I.get<IClientHttp>();

  void teste()async{
    await _clientHttp.request(
	  data: {
		"usuario":{
		  "id":1
		}
	  },
	  method: HttpMethods.post,
	  uri: HttpRoutes.userData
	);
  }
}