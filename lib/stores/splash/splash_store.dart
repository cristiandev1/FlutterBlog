import 'package:flutter_blog/models/user_global_model.dart';
import 'package:flutter_blog/repositories/splash_repository.dart';
import 'package:flutter_blog/stores/category/category_store.dart';
import 'package:flutter_blog/stores/user/user_store.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'splash_store.g.dart';

class SplashStore = _SplashStore with _$SplashStore;

abstract class _SplashStore with Store{

  final _userStore = GetIt.I.get<UserStore>();
  final _splashRepository = GetIt.I.get<SplashRepository>();
  final _categoryStore = GetIt.I.get<CategoryStore>();

  @action
  Future<bool> splash()async{
    _userStore.user = await _splashRepository.splash(idUser: 1);
    if(_userStore.user != null){
      await _categoryStore.getCategories();
      return true;
    }else{
      return false;
    }
  }
}