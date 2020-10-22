import 'package:flutter_blog/interfaces/ClientHttpInterface.dart';
import 'package:flutter_blog/services/http_service/HttpRequestService.dart';
import 'package:get_it/get_it.dart';

class Injectors{
  static final Injectors instance = Injectors._();
  Injectors._();

  void initialize(){
	GetIt.I.registerLazySingleton<IClientHttp>(() => HttpRequestService());
  }
}