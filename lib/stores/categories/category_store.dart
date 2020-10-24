import 'package:flutter/cupertino.dart';
import 'package:flutter_blog/models/category_model.dart';
import 'package:flutter_blog/models/user_global_model.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'category_store.g.dart';

class CategoryStore = _CategoryStore with _$CategoryStore;

abstract class _CategoryStore with Store{

  TextEditingController controllerTitle = TextEditingController();
  TextEditingController controllerDescription = TextEditingController();

  @observable
  List<CategoryModel> categories = List();

  @observable
  String selectedCategory;

  @observable
  int idCategory;

  @action
  void setSelectedCategory(String val) => selectedCategory = val;

  @action
  void checkItem({String val}){
    for(var item in categories){
      if(item.nome == val){
        idCategory = item.idCategoria;
      }
    }
  }
}