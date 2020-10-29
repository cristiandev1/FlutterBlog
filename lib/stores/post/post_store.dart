import 'package:flutter/cupertino.dart';
import 'package:flutter_blog/models/post_model.dart';
import 'package:flutter_blog/repositories/post_repository.dart';
import 'package:flutter_blog/stores/user/user_store.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'post_store.g.dart';

class PostStore = _PostStore with _$PostStore;

abstract class _PostStore with Store{

  final _postRepository = GetIt.I.get<PostRepository>();
  final _user = GetIt.I.get<UserStore>();

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

      if(create){
        await getPosts();
        return true;
      }

      return false;
    }
    return false;
  }

  @action
  Future<List<PostModel>> getPosts() async => _user.user.postagens = await _postRepository.getPosts();
}