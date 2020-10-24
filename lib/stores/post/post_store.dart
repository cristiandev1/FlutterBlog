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

  @action
  Future<bool> create({int idCategory, String title, description})async{
    bool res = await _postRepository.create(idCategory: idCategory, title: title, description: description);
    if(res)
      return true;

    return false;
  }

}