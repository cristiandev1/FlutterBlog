import 'package:flutter/material.dart';
import 'package:flutter_blog/screens/login/components/background_component.dart';
import 'package:flutter_blog/stores/login/login_store.dart';


class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  LoginStore _loginStore = LoginStore();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
	_loginStore.teste();
	// Future.delayed(Duration(seconds: 3),(){
	//   Navigator.of(context).pushReplacementNamed(AppRoutes.login);
	// });

  }
  @override
  Widget build(BuildContext context) {
	Size size = MediaQuery.of(context).size;
	return Scaffold(
	  body: BackgroundComponent(
		child: SingleChildScrollView(
		  child: Column(
			mainAxisAlignment: MainAxisAlignment.center,
			children: <Widget>[
			  Text(
				"OLÁ, SEJA BEM-VINDO",
				style: TextStyle(fontWeight: FontWeight.bold),
			  ),
			  SizedBox(height: size.height * 0.03),
			  CircularProgressIndicator(
				strokeWidth: 2,
				valueColor: AlwaysStoppedAnimation<Color>(Colors.pinkAccent),
			  ),
			],
		  ),
		),
	  ),
	);
  }
}
