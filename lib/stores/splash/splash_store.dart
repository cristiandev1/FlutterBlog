import 'package:flutter_blog/models/user_global_model.dart';
import 'package:flutter_blog/repositories/splash_repository.dart';
import 'package:flutter_blog/stores/categories/category_store.dart';
import 'package:flutter_blog/stores/post/post_store.dart';
import 'package:flutter_blog/stores/user/user_store.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'splash_store.g.dart';

class SplashStore = _SplashStore with _$SplashStore;

abstract class _SplashStore with Store{

  final _userStore = GetIt.I.get<UserStore>();
  final _categoryStore = GetIt.I.get<CategoryStore>();
  final _postStore = GetIt.I.get<PostStore>();
  final _splashRepository = GetIt.I.get<SplashRepository>();

  @action
  Future<bool> splash()async{
    _userStore.user = await _splashRepository.splash(idUser: 1);
    if(_userStore.user != null){
      _postStore.posts = _userStore.user.postagens;
      _categoryStore.categories = _userStore.user.categorias;
      return true;
    }else{
      return false;
    }
  }
}