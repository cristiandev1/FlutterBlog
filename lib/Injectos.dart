import 'package:flutter_blog/interfaces/ClientHttpInterface.dart';
import 'package:flutter_blog/repositories/login_repository.dart';
import 'package:flutter_blog/services/http_service/HttpRequestService.dart';
import 'package:flutter_blog/stores/login/login_store.dart';
import 'package:flutter_blog/stores/user/user_store.dart';
import 'package:get_it/get_it.dart';

class Injectors{
  static final Injectors instance = Injectors._();
  Injectors._();

  void initialize(){
	GetIt.I.registerLazySingleton<IClientHttp>(() => HttpRequestService());

	GetIt.I.registerLazySingleton<LoginStore>(() => LoginStore());
	GetIt.I.registerLazySingleton<UserStore>(() => UserStore());

	GetIt.I.registerLazySingleton<LoginRepository>(() => LoginRepository());
  }
}