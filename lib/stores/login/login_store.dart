import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter_blog/repositories/login_repository.dart';
import 'package:flutter_blog/stores/user/user_store.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store{

  final _loginRepository = GetIt.I.get<LoginRepository>();
  final _userGlobal = GetIt.I.get<UserStore>();

  @observable
  String email = '';

  @observable
  String password = '';

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  @action
  Future<bool> login() async{
    password = md5.convert(utf8.encode(password)).toString();
    _userGlobal.userGlobal = await _loginRepository.login(email: email, senha: password,);
    if(_userGlobal.userGlobal != null){
      return true;
    }else{
      return false;
    }
  }

}