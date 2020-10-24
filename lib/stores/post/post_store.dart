import 'package:flutter_blog/models/post_model.dart';
import 'package:mobx/mobx.dart';

part 'post_store.g.dart';

class PostStore = _PostStore with _$PostStore;

abstract class _PostStore with Store{

  @observable
  List<PostModel> posts = List();

}