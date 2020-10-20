import 'package:flutter/material.dart';

class BodyPostComponent extends StatefulWidget {
  @override
  _BodyPostComponentState createState() => _BodyPostComponentState();
}

class _BodyPostComponentState extends State<BodyPostComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
	  child: Column(
		children: [
		  Center(child: Text('Titulo da Postagem', style: TextStyle(fontSize: 25),)),
		  Center(child: Text('Conteúdo da Postagem', style: TextStyle(fontSize: 18),)),
		],
	  ),
	);
  }
}
