import 'package:flutter/material.dart';
import 'package:flutter_blog/models/post_model.dart';

class BodyPostComponent extends StatefulWidget {
  final PostModel post;

  const BodyPostComponent({Key key, this.post}) : super(key: key);
  @override
  _BodyPostComponentState createState() => _BodyPostComponentState();
}

class _BodyPostComponentState extends State<BodyPostComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
	  child: Column(
		children: [
		  SizedBox(height: 10,),
		  Center(child: Text('${widget.post.titulo}', style: TextStyle(fontSize: 25),)),
		  SizedBox(height: 10,),
		  Text('${widget.post.assunto}', style: TextStyle(fontSize: 18),),
		  SizedBox(height: 10,),
		  Text('Data : ${widget.post.dataPostagem}', style: TextStyle(fontSize: 14),),
		  Text('Categoria : ${widget.post.nomeCategoria}', style: TextStyle(fontSize: 14),),
		],
	  ),
	);
  }
}
