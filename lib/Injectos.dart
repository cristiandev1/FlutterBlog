import 'package:flutter_blog/interfaces/ClientHttpInterface.dart';
import 'package:flutter_blog/repositories/category_repository.dart';
import 'package:flutter_blog/repositories/login_repository.dart';
import 'package:flutter_blog/repositories/post_repository.dart';
import 'package:flutter_blog/repositories/splash_repository.dart';
import 'package:flutter_blog/services/http_service/HttpRequestService.dart';
import 'package:flutter_blog/stores/category/category_store.dart';
import 'package:flutter_blog/stores/login/login_store.dart';
import 'package:flutter_blog/stores/post/post_store.dart';
import 'package:flutter_blog/stores/splash/splash_store.dart';
import 'package:flutter_blog/stores/user/user_store.dart';
import 'package:get_it/get_it.dart';

class Injectors{
  static final Injectors instance = Injectors._();
  Injectors._();

  void initialize(){
	GetIt.I.registerLazySingleton<IClientHttp>(() => HttpRequestService());

	GetIt.I.registerLazySingleton<SplashStore>(() => SplashStore());
	GetIt.I.registerLazySingleton<LoginStore>(() => LoginStore());
	GetIt.I.registerLazySingleton<UserStore>(() => UserStore());
	GetIt.I.registerLazySingleton<PostStore>(() => PostStore());
	GetIt.I.registerLazySingleton<CategoryStore>(() => CategoryStore());

	GetIt.I.registerLazySingleton<LoginRepository>(() => LoginRepository());
	GetIt.I.registerLazySingleton<SplashRepository>(() => SplashRepository());
	GetIt.I.registerLazySingleton<PostRepository>(() => PostRepository());
	GetIt.I.registerLazySingleton<CategoryRepository>(() => CategoryRepository());
  }
}