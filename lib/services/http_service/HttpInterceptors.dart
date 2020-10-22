import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter_blog/config/AppConfig.dart';
import 'package:flutter_blog/widgets/loadings.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'HttpErrorController.dart';


class HttpStatusCode{
   static const int notFound = 404;
   static const int ok = 200;
}

class HttpInterceptors{
  HttpErrorController controllerError = HttpErrorController();

  bool loadingOverlay;
  Dio dio = Dio(BaseOptions(baseUrl: AppConfig.urlApi, connectTimeout: 15000, receiveTimeout: 15000));
  CancelToken token = CancelToken();

  HttpInterceptors(){
	defaultInterceptor();
  }

   void defaultInterceptor(){
      dio.interceptors.add(InterceptorsWrapper(
		 onRequest: defaultRequestOptions,
		 onResponse: defaultResponse,
		 onError: defaultError
	  ));
   }

   Future<RequestOptions> defaultRequestOptions(RequestOptions options)async{
	 print(options.extra['uri']);
     print(options.data);
      //open loading dialog
	 if(loadingOverlay)
      	Get.dialog(OverlayLoading(), barrierDismissible: false);

	  ///este parametro esta dizendo que o dio deve me retornar um plaintext.
	  ///Isso precisa ser feito aqui no request. Voce diz para o request o que quer de retorno
	  options.responseType = ResponseType.plain;

	  var md5Final;

	  if (options.data != null) {
		 var encodeDados = json.encode(options.data);
		 md5Final = md5.convert(utf8.encode("$encodeDados${AppConfig.apiKey}"));
	  } else {
		 md5Final = md5.convert(utf8.encode("${options.extra['uri']}${AppConfig.apiKey}"));
	  }

	  options.headers = {
		'content-type' : 'application/json',
		'accept': 'application/json',
		'tk': '${md5Final.toString()}',
		'vs_app': '${AppConfig.appVersion}',
	  };

	  return options;
   }

	Future<Response> defaultResponse(Response response)async{
     print(response.data);
	 if(loadingOverlay)
	  	Get.close(1);//close loading dialog
	  ///O texto retornado eh interpretado como json automaticamente pelo funcao json.decode,
	  ///e o json.decode transforma esse json em um objeto Map<String, dynamic>
	  response.data = json.decode(response.data);

	  if(response.data['status'] == 'ok')
	  	response.data = response.data['dados'] ?? true;
	  else {
		controllerError.showError(response.data['message'].toString());
		response.data = null;
	  }

	  return response;
	}


  Future<Response> defaultError(DioError e)async{
	if(loadingOverlay)
	  Get.close(1);//close loading dialog

	String errorMessage;

	//caso de timeout na conexao
	if(e.type == DioErrorType.CONNECT_TIMEOUT || e.type == DioErrorType.RECEIVE_TIMEOUT){
	  controllerError.showError("Limite de conexão excedido!");
	}else if(e.response != null){ //Quando a conexao respondeu mas existe algum erro na url do servidor
	  if(e.response.statusCode != HttpStatusCode.notFound) {
		e.response.data = json.decode(e.response.data);
		errorMessage = e.response.data['message'];
	  }else
		errorMessage = "Ocorreu um erro inesperado. Codigo: ${e.response.statusCode}";

	  controllerError.showError(errorMessage);
	}else{//quando nao houver conhexao com o servidor, seja por falta de internet ou qualquer coisa
	  controllerError.showError("Parece que vc esta sem conexao");
	}

	return dio.resolve(null);
  }
}