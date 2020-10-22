enum HttpMethods{get, post, put, delete}

abstract class IClientHttp{
  Future<T> request<T>({
	Map<String, dynamic> data,
	String uri,
	HttpMethods method,
  	bool loading});
}