import 'package:flutter_blog/config/HttpRoutes.dart';
import 'package:flutter_blog/interfaces/ClientHttpInterface.dart';
import 'package:flutter_blog/models/category_model.dart';
import 'package:flutter_blog/stores/user/user_store.dart';
import 'package:get_it/get_it.dart';

class CategoryRepository{

  final _clientHttp = GetIt.I.get<IClientHttp>();
  final _user = GetIt.I.get<UserStore>();

  Future<List<CategoryModel>> getCategories()async{
    List<CategoryModel> categories = List();

    List response = await _clientHttp.request(
      uri: HttpRoutes.getCategories,
      method: HttpMethods.post,
      data: {
        "usuario":{
          "id": _user.user.id,
        }
      }
    );

    if(response != null){
      for(Map<String, dynamic> cateogry in response)
        categories.add(CategoryModel.fromJson(cateogry));

      return categories;
    }

    return categories;
  }

  Future<bool> categoryRegister({String name})async{
    bool response = await _clientHttp.request(
      uri: HttpRoutes.registerCategory,
      method: HttpMethods.post,
      data: {
        "usuario":{
          "id": _user.user.id,
        },
        "nome": name,
      }
    );

    if(response != null) return response;

    return false;
  }

}