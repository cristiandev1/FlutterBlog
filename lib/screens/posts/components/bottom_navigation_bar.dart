import 'package:flutter/material.dart';
import 'package:flutter_blog/screens/constants.dart';

class BottomNavigationBarComponent extends StatefulWidget {
  @override
  _BottomNavigationBarComponentState createState() => _BottomNavigationBarComponentState();
}

class _BottomNavigationBarComponentState extends State<BottomNavigationBarComponent> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
	  currentIndex: _currentIndex,
	  type: BottomNavigationBarType.fixed,
	  backgroundColor: kPrimaryColor,
	  selectedItemColor: Colors.white,
	  unselectedItemColor: Colors.white.withOpacity(.60),
	  selectedFontSize: 14,
	  unselectedFontSize: 14,
	  onTap: (value){setState(() => _currentIndex = value);},
	  items: [
		BottomNavigationBarItem(
		  title: Text('Postagens'),
		  icon: Icon(Icons.favorite),
		),
		BottomNavigationBarItem(
		  title: Text('Pesquisar'),
		  icon: Icon(Icons.search),
		),

	  ],
	);
  }
}
