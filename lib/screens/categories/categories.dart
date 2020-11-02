import 'package:flutter/material.dart';
import 'package:flutter_blog/stores/category/category_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  final _categoryStore = GetIt.I.get<CategoryStore>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Observer(
            builder: (_){
              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _categoryStore.categories.length,
                itemBuilder: (_,index){
                  return InkWell(
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            //leading: Icon(FontAwesomeIcons.info, size: 50,),
                            title: Text('${_categoryStore.categories[index].nome}', style: TextStyle(fontSize: 20),),
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
