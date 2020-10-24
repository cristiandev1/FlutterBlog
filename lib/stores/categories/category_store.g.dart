// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CategoryStore on _CategoryStore, Store {
  final _$categoriesAtom = Atom(name: '_CategoryStore.categories');

  @override
  List<CategoryModel> get categories {
    _$categoriesAtom.reportRead();
    return super.categories;
  }

  @override
  set categories(List<CategoryModel> value) {
    _$categoriesAtom.reportWrite(value, super.categories, () {
      super.categories = value;
    });
  }

  final _$selectedCategoryAtom = Atom(name: '_CategoryStore.selectedCategory');

  @override
  String get selectedCategory {
    _$selectedCategoryAtom.reportRead();
    return super.selectedCategory;
  }

  @override
  set selectedCategory(String value) {
    _$selectedCategoryAtom.reportWrite(value, super.selectedCategory, () {
      super.selectedCategory = value;
    });
  }

  final _$idCategoryAtom = Atom(name: '_CategoryStore.idCategory');

  @override
  int get idCategory {
    _$idCategoryAtom.reportRead();
    return super.idCategory;
  }

  @override
  set idCategory(int value) {
    _$idCategoryAtom.reportWrite(value, super.idCategory, () {
      super.idCategory = value;
    });
  }

  final _$_CategoryStoreActionController =
      ActionController(name: '_CategoryStore');

  @override
  void setSelectedCategory(String val) {
    final _$actionInfo = _$_CategoryStoreActionController.startAction(
        name: '_CategoryStore.setSelectedCategory');
    try {
      return super.setSelectedCategory(val);
    } finally {
      _$_CategoryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void checkItem({String val}) {
    final _$actionInfo = _$_CategoryStoreActionController.startAction(
        name: '_CategoryStore.checkItem');
    try {
      return super.checkItem(val: val);
    } finally {
      _$_CategoryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
categories: ${categories},
selectedCategory: ${selectedCategory},
idCategory: ${idCategory}
    ''';
  }
}
