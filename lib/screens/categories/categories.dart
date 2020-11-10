import 'package:flutter/material.dart';
import 'package:flutter_blog/stores/category/category_store.dart';
import 'package:flutter_blog/widgets/default_input.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  final _categoryStore = GetIt.I.get<CategoryStore>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _categoryStore.controllerSearch.addListener(() {
      _categoryStore.searchCategory();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DefaultInput(
            controller: _categoryStore.controllerSearch,
            typeColor: TypeColor.normal,
            prefixIcon: FontAwesomeIcons.search,
            textCapitalization: TextCapitalization.none,
            text: "Pesquisar",
          ),
          Observer(
            builder: (_){
              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _categoryStore.categoriesFiltered.length,
                itemBuilder: (_,index){
                  return InkWell(
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            //leading: Icon(FontAwesomeIcons.info, size: 50,),
                            title: Text('${_categoryStore.categoriesFiltered[index].nome}', style: TextStyle(fontSize: 20),),
                          ),
                        ],
                      ),
                    ),
                    onTap: (){},
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
