import 'package:flutter/material.dart';
import 'package:flutter_blog/config/AppConfig.dart';
import 'package:flutter_blog/config/AppRoutes.dart';
import 'package:flutter_blog/screens/login/components/background_component.dart';
import 'package:flutter_blog/stores/login/login_store.dart';
import 'package:flutter_blog/stores/user/user_store.dart';
import 'package:flutter_blog/widgets/rounded_button.dart';
import 'package:flutter_blog/widgets/rounded_input_field.dart';
import 'package:flutter_blog/widgets/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';

class BodyComponent extends StatelessWidget {
  final _loginStore = GetIt.I.get<LoginStore>();
  final _userStore = GetIt.I.get<UserStore>();

  @override
  Widget build(BuildContext context) {
	Size size = MediaQuery.of(context).size;
	return BackgroundComponent(
	  child: SingleChildScrollView(
		child: Column(
		  mainAxisAlignment: MainAxisAlignment.center,
		  children: <Widget>[
			Text(
			  "Olá, realize seu login!",
			  style: TextStyle(fontWeight: FontWeight.bold),
			),
			SizedBox(height: size.height * 0.03),
			SvgPicture.asset(
			  AppConfig.urlLocalPhotos + "icons/signup.svg",
			  height: size.height * 0.35,
			),
			RoundedInputField(
			  hintText: "Digite seu Email",
			  onChanged: (value) => _loginStore.setEmail(value),
			),
			RoundedPasswordField(
			  onChanged: (value) => _loginStore.setPassword(value),
			),
			RoundedButton(
			  text: "CADASTRE-SE",
			  onpress: () async{
			    Navigator.of(context).pushNamed(AppRoutes.register);
			  },
			),
			RoundedButton(
			  text: "ENTRAR",
			  onpress: () async{
				bool res = await _loginStore.login();
				if(res){
				  Navigator.of(context).pushNamed(AppRoutes.posts);
				}

			  },
			),
			SizedBox(height: size.height * 0.03),
		  ],
		),
	  ),
	);
  }
}
