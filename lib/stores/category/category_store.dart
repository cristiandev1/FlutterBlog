import 'package:flutter_blog/models/category_model.dart';
import 'package:flutter_blog/repositories/category_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'category_store.g.dart';

class CategoryStore = _CategoryStore with _$CategoryStore;

abstract class _CategoryStore with Store{

  final _categoryRepository = GetIt.I.get<CategoryRepository>();
  @observable
  List categoryList = List();

  @observable
  String category = '';

  @observable
  List<CategoryModel> categories = List();

  @action
  Future<List<CategoryModel>> getCategories()async => categories = await _categoryRepository.getCategories();

}