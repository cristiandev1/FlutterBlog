import 'package:flutter/material.dart';
import 'package:flutter_blog/config/AppConfig.dart';
import 'package:flutter_blog/config/AppRoutes.dart';
import 'package:flutter_blog/screens/login/components/background_component.dart';
import 'package:flutter_blog/widgets/rounded_button.dart';
import 'package:flutter_blog/widgets/rounded_input_field.dart';
import 'package:flutter_blog/widgets/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';

class BodyComponent extends StatelessWidget {
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
			  onChanged: (value) {},
			),
			RoundedPasswordField(
			  onChanged: (value) {},
			),
			RoundedButton(
			  text: "ENTRAR",
			  onpress: () {
				Future.delayed(Duration(seconds: 3),(){
				  Navigator.of(context).pushReplacementNamed(AppRoutes.posts);
				});
			  },
			),
			SizedBox(height: size.height * 0.03),
		  ],
		),
	  ),
	);
  }
}
