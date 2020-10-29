import 'package:flutter/cupertino.dart';
import 'package:flutter_blog/models/post_model.dart';
import 'package:flutter_blog/repositories/post_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'post_store.g.dart';

class PostStore = _PostStore with _$PostStore;

abstract class _PostStore with Store{

  final _postRepository = GetIt.I.get<PostRepository>();

  @observable
  List<PostModel> posts = List();

  @observable
  int idCategory;

  @action
  void setId(int id) => idCategory = id;

  TextEditingController controllerTitle = TextEditingController();
  TextEditingController controllerDescription = TextEditingController();

  @action
  Future<bool> create()async{
    if(controllerTitle.text != '' && controllerDescription.text != ''){
      bool create = await _postRepository.create(
        title: controllerTitle.text,
        description: controllerDescription.text,
        idCategory: idCategory,
      );

      if(create) return true;

      return false;
    }
    return false;
  }
}