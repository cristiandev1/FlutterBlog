// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CategoryStore on _CategoryStore, Store {
  final _$categoryModelAtom = Atom(name: '_CategoryStore.categoryModel');

  @override
  CategoryModel get categoryModel {
    _$categoryModelAtom.reportRead();
    return super.categoryModel;
  }

  @override
  set categoryModel(CategoryModel value) {
    _$categoryModelAtom.reportWrite(value, super.categoryModel, () {
      super.categoryModel = value;
    });
  }

  final _$categoryListAtom = Atom(name: '_CategoryStore.categoryList');

  @override
  List<dynamic> get categoryList {
    _$categoryListAtom.reportRead();
    return super.categoryList;
  }

  @override
  set categoryList(List<dynamic> value) {
    _$categoryListAtom.reportWrite(value, super.categoryList, () {
      super.categoryList = value;
    });
  }

  final _$categoryAtom = Atom(name: '_CategoryStore.category');

  @override
  String get category {
    _$categoryAtom.reportRead();
    return super.category;
  }

  @override
  set category(String value) {
    _$categoryAtom.reportWrite(value, super.category, () {
      super.category = value;
    });
  }

  final _$categoriesFilteredAtom =
      Atom(name: '_CategoryStore.categoriesFiltered');

  @override
  List<CategoryModel> get categoriesFiltered {
    _$categoriesFilteredAtom.reportRead();
    return super.categoriesFiltered;
  }

  @override
  set categoriesFiltered(List<CategoryModel> value) {
    _$categoriesFilteredAtom.reportWrite(value, super.categoriesFiltered, () {
      super.categoriesFiltered = value;
    });
  }

  final _$getCategoriesAsyncAction =
      AsyncAction('_CategoryStore.getCategories');

  @override
  Future<List<CategoryModel>> getCategories() {
    return _$getCategoriesAsyncAction.run(() => super.getCategories());
  }

  final _$createAsyncAction = AsyncAction('_CategoryStore.create');

  @override
  Future<bool> create() {
    return _$createAsyncAction.run(() => super.create());
  }

  final _$searchCategoryAsyncAction =
      AsyncAction('_CategoryStore.searchCategory');

  @override
  Future<void> searchCategory() {
    return _$searchCategoryAsyncAction.run(() => super.searchCategory());
  }

  @override
  String toString() {
    return '''
categoryModel: ${categoryModel},
categoryList: ${categoryList},
category: ${category},
categoriesFiltered: ${categoriesFiltered}
    ''';
  }
}
