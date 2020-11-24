import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_blog/repositories/register_repository.dart';
import 'package:mobx/mobx.dart';

part 'register_store.g.dart';

class RegisterStore = _RegisterStore with _$RegisterStore;

abstract class _RegisterStore with Store{

  RegisterRepository registerRepository = RegisterRepository();

  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerLastName = TextEditingController();
  TextEditingController controllerCity = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();


  @action
  Future<bool> register()async{
    String password = md5.convert(utf8.encode(controllerPassword.text)).toString();

    Map<String,dynamic> data = {
      "nome": controllerName.text,
      "sobrenome": controllerLastName.text,
      "cidade": controllerCity.text,
      "email": controllerEmail.text,
      "senha": password,
    };

    bool res = await registerRepository.register(data: data);

    return res;
  }

}