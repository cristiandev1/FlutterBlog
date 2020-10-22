import 'package:dio/dio.dart';
import 'package:flutter_blog/interfaces/ClientHttpInterface.dart';
import 'HttpInterceptors.dart';

class HttpRequestService extends HttpInterceptors implements IClientHttp{

   Future<T> request<T>({
	  Map<String, dynamic> data,
	  String uri,
	  HttpMethods method,
	  bool loading = true
   })async{
	  loadingOverlay = loading;

	  RequestOptions options = RequestOptions(extra: {'uri': uri});
	  Response response;

	  switch (method){
		 case HttpMethods.get:
			response = await dio.get(uri, options: options);

			break;
		 case HttpMethods.post:
			response = await dio.post(uri, data: data, options: options);

			break;
		 case HttpMethods.put:
			response = await dio.put(uri, data: data, options: options);

			break;
		 case HttpMethods.delete:
			response = await dio.delete(uri, options: options);

			break;
	  }

	  T resp = response.data;

	  return resp;
   }
}