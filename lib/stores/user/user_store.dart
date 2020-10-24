import 'package:flutter_blog/models/user_global_model.dart';
import 'package:mobx/mobx.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store{

  @observable
  UserGlobalModel user = UserGlobalModel();


}