import 'package:flutter/material.dart';
import 'package:flutter_blog/models/category_model.dart';
import 'package:flutter_blog/screens/constants.dart';
import 'package:flutter_blog/screens/posts/components/body_component.dart';
import 'package:flutter_blog/screens/posts/components/bottom_navigation_bar.dart';
import 'package:flutter_blog/stores/categories/category_store.dart';
import 'package:flutter_blog/stores/post/post_store.dart';
import 'package:flutter_blog/widgets/default_scaffold.dart';
import 'package:flutter_blog/widgets/dialog_input.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:flutter_material_pickers/helpers/show_checkbox_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class Posts extends StatefulWidget {
  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {

  final _categoryStore = GetIt.I.get<CategoryStore>();
  final _postStore = GetIt.I.get<PostStore>();

  @override
  Widget build(BuildContext context) {
	List<String> categories = List();


    if(_categoryStore.categories.length > 0){
		for(var i =0; i < _categoryStore.categories.length; i++){
		  categories.add(_categoryStore.categories[i].nome);
		}
	}


    return DefaultScaffold(
	  appBarTitle: "Postagens",
	  action1: IconButton(
		icon: Icon(FontAwesomeIcons.plusCircle, size: 20, color: Colors.white,),
		onPressed: (){
		  _categoryStore.controllerDescription.text = '';
		  _categoryStore.controllerTitle.text = '';

		  Get.dialog(AlertDialog(
			title: Text('Inserir Postagem'),
			content: Column(
			  mainAxisSize: MainAxisSize.min,
			  children: [
			    DialogInput(
				  textCapitalization: TextCapitalization.none,
				  label: "Titulo",
				  controller: _categoryStore.controllerTitle,
				),
				DialogInput(
				  textCapitalization: TextCapitalization.none,
				  label: "Descrição",
				  controller: _categoryStore.controllerDescription,
				),
				SizedBox(height: 15,),
				RaisedButton(
				  child: Text('SELECIONAR CATEGORIA', style: TextStyle(color: Colors.white),),
				  color: kPrimaryColor,
				  onPressed: (){
					showMaterialScrollPicker(
					  headerColor: kPrimaryColor,
					  buttonTextColor: kPrimaryColor,
					  context: context,
					  title: "SELECIONAR CATEGORIA",
					  items: categories,
					  selectedItem: _categoryStore.selectedCategory,
					  onChanged: (value) {
						_categoryStore.setSelectedCategory(value);
						_categoryStore.checkItem(val: value);
					  },
					);
				  },
				),
				SizedBox(height: 20,),
				RaisedButton(
				  child: Text('CADASTRAR', style: TextStyle(color: Colors.white),),
				  color: kPrimaryColor,
				  onPressed: ()async{
				    bool res = await _postStore.create(
					  idCategory: _categoryStore.idCategory,
					  title: _categoryStore.controllerTitle.text,
					  description: _categoryStore.controllerDescription.text,
					);

				    if(res)
				      Navigator.pop(context);
				  },
				),
			  ],
			),
		  ));
		},
	  ),
	  body: BodyComponentPost(),
	  bottomNavigationBar: BottomNavigationBarComponent(),
	);
  }
}
