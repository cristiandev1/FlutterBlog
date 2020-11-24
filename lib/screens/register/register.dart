import 'package:flutter/material.dart';
import 'package:flutter_blog/config/AppConfig.dart';
import 'package:flutter_blog/config/AppRoutes.dart';
import 'package:flutter_blog/screens/login/components/background_component.dart';
import 'package:flutter_blog/stores/login/login_store.dart';
import 'package:flutter_blog/stores/register/register_store.dart';
import 'package:flutter_blog/stores/user/user_store.dart';
import 'package:flutter_blog/widgets/rounded_button.dart';
import 'package:flutter_blog/widgets/rounded_input_field.dart';
import 'package:flutter_blog/widgets/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class Register extends StatelessWidget {

  RegisterStore registerStore = RegisterStore();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
	Size size = MediaQuery.of(context).size;
	return Scaffold(
	  body: BackgroundComponent(
	    child: SingleChildScrollView(
	  	child: Form(
		  key: _formKey,
	  	  child: Column(
	  	    mainAxisAlignment: MainAxisAlignment.center,
	  	    children: <Widget>[
	  	  	Text(
	  	  	  "Olá, insira seus dados para realizar o seu cadastro!",
	  	  	  style: TextStyle(fontWeight: FontWeight.bold),
	  	  	),
	  	  	SizedBox(height: size.height * 0.03),
	  	  	RoundedInputField(
			  controller: registerStore.controllerName,
	  	  	  hintText: "Digite seu nome",
	  	  	),
			RoundedInputField(
			  controller: registerStore.controllerLastName,
			  hintText: "Digite seu sobrenome",
			),
			RoundedInputField(
			  controller: registerStore.controllerCity,
			  hintText: "Digite sua cidade",
			),
			RoundedInputField(
			  controller: registerStore.controllerEmail,
			  hintText: "Digite seu email",
			),
	  	  	RoundedPasswordField(
			  controller: registerStore.controllerPassword,
	  	  	),
	  	  	RoundedButton(
	  	  	  text: "CADASTRE-SE",
	  	  	  onpress: () async{
	  	  	    if(_formKey.currentState.validate()){
	  	  	     bool res = await registerStore.register();
	  	  	     if(res){
				   Navigator.pop(context);

				   Get.snackbar('Usuario', 'Usuario cadastrado');
				 }

				}
	  	  	  },
	  	  	),
	  	  	SizedBox(height: size.height * 0.03),
	  	    ],
	  	  ),
	  	),
	    ),
	  ),
	);
  }
}
