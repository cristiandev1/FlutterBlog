import 'package:flutter/material.dart';
import 'package:flutter_blog/screens/categories/categories.dart';
import 'package:flutter_blog/screens/constants.dart';
import 'package:flutter_blog/screens/posts/components/body_component.dart';
import 'package:flutter_blog/screens/posts/components/bottom_navigation_bar.dart';
import 'package:flutter_blog/stores/category/category_store.dart';
import 'package:flutter_blog/stores/post/post_store.dart';
import 'package:flutter_blog/stores/user/user_store.dart';
import 'package:flutter_blog/widgets/default_scaffold.dart';
import 'package:flutter_blog/widgets/dialog_input.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:select_dialog/select_dialog.dart';

class Posts extends StatefulWidget {
  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {

  final _user = GetIt.I.get<UserStore>();
  final _categoryStore = GetIt.I.get<CategoryStore>();
  final _postStore = GetIt.I.get<PostStore>();

  int _currentIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
	BodyComponentPost(),
	Categories(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
	  appBarTitle: _currentIndex == 0 ? "Postagens" : "Categorias",
	  action1: _currentIndex == 0 ? IconButton(
		icon: Icon(FontAwesomeIcons.plusCircle, size: 20, color: Colors.white,),
		onPressed: (){
		  _postStore.controllerDescription.text = '';
		  _postStore.controllerTitle.text = '';
		  _postStore.idCategory = 0;

		  Get.dialog(AlertDialog(
			title: Text('Cadastrar'),
			content: Column(
			  mainAxisSize: MainAxisSize.min,
			  children: [
				DialogInput(
				  textCapitalization: TextCapitalization.none,
				  label: "Informe o titulo",
				  controller: _postStore.controllerTitle,
				),
				DialogInput(
				  textCapitalization: TextCapitalization.none,
				  label: "Informe a desrição",
				  controller: _postStore.controllerDescription,
				),
				SizedBox(height: 20,),
				Row(
				  children: [
					RaisedButton(
					  color: kPrimaryColor,
					  textColor: Colors.white,
					  child: Text('Categorias'),
					  onPressed: (){
						String category = "Nenhuma categoria selecionada";

						SelectDialog.showModal<String>(
						  context,
						  label: "Selecione uma categoria",
						  selectedValue: _categoryStore.category,
						  items: List.generate(_user.user.categorias.length, (index) => "${_user.user.categorias[index].idCategoria}|${_user.user.categorias[index].nome}"),
						  itemBuilder: (context, item, index){


							for(var i = 0; i < item.length; i++){
							  _categoryStore.categoryList = item.split("|");
							}

							return ListTile(
							  title: Text(_categoryStore.categoryList[1]),
							);
						  },
						  onChange: (String selected) {
							_categoryStore.category = selected.split("|")[1];
							_postStore.setId(int.parse(selected.split("|")[0]));
						  },
						);
					  },
					),
					SizedBox(width: 55,),
					RaisedButton(
					  color: kPrimaryColor,
					  textColor: Colors.white,
					  child: Text('Cadastrar'),
					  onPressed: ()async{

					    if(_postStore.controllerTitle.text == null || _postStore.controllerTitle.text == '' ||
							_postStore.controllerDescription.text == null || _postStore.controllerDescription.text == ''
						){
						  Get.snackbar(
							'Postagem',
							'Para realizar o cadastro é necessário preencher os dados',
							backgroundColor: Colors.white,
						  );
						}

						bool res = await _postStore.create();
						if(res){
						  Navigator.pop(context);
						}
					  },
					),
				  ],
				),
			  ],
			),
		  ));
		},
	  ) : IconButton(
		icon: Icon(FontAwesomeIcons.plusCircle, size: 20, color: Colors.white,),
		onPressed: (){

		  _categoryStore.controllerName.text = '';

		  Get.dialog(AlertDialog(
			title: Text('Cadastrar Categoria'),
			content: Column(
			  mainAxisSize: MainAxisSize.min,
			  children: [
				DialogInput(
				  textCapitalization: TextCapitalization.none,
				  label: "Informe o nome",
				  controller: _categoryStore.controllerName,
				),
				SizedBox(height: 20,),
				RaisedButton(
				  color: kPrimaryColor,
				  textColor: Colors.white,
				  child: Text('Cadastrar'),
				  onPressed: ()async{
				    bool res = await _categoryStore.create();
				    if(res){
				      Navigator.pop(context);
					}
				  },
				),
			  ],
			),
		  ));
		},
	  ),
	  body: _widgetOptions.elementAt(_currentIndex),
	  bottomNavigationBar:  BottomNavigationBar(
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
			title: Text('Categorias'),
			icon: Icon(Icons.apps),
		  ),
		],
	  ),
	);
  }
}
