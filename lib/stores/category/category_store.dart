import 'package:flutter/cupertino.dart';
import 'package:flutter_blog/models/category_model.dart';
import 'package:flutter_blog/models/user_global_model.dart';
import 'package:flutter_blog/repositories/category_repository.dart';
import 'package:flutter_blog/stores/user/user_store.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'category_store.g.dart';

class CategoryStore = _CategoryStore with _$CategoryStore;

abstract class _CategoryStore with Store{

  final _categoryRepository = GetIt.I.get<CategoryRepository>();
  final _user = GetIt.I.get<UserStore>();

  @observable
  CategoryModel categoryModel = CategoryModel();

  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerSearch = TextEditingController();

  @observable
  List categoryList = List();

  @observable
  String category = '';


  @observable
  List<CategoryModel> categoriesFiltered = List();

  @action
  Future<List<CategoryModel>> getCategories()async => _user.user.categorias = await _categoryRepository.getCategories();

  @action
  Future<bool> create()async{
    bool res = await _categoryRepository.categoryRegister(name: controllerName.text);
    if(res){
       categoriesFiltered = await getCategories();
      return true;
    }

    return false;
  }

  @action
  Future<void> searchCategory() async{
    List<CategoryModel> listFiltered = List();

    for(var item in _user.user.categorias){
      if(item.nome.toLowerCase().contains(controllerSearch.text.toLowerCase())){
        listFiltered.add(item);
      }
    }

    categoriesFiltered = listFiltered;
  }
}