// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PostStore on _PostStore, Store {
  final _$postsAtom = Atom(name: '_PostStore.posts');

  @override
  List<PostModel> get posts {
    _$postsAtom.reportRead();
    return super.posts;
  }

  @override
  set posts(List<PostModel> value) {
    _$postsAtom.reportWrite(value, super.posts, () {
      super.posts = value;
    });
  }

  final _$idCategoryAtom = Atom(name: '_PostStore.idCategory');

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

  final _$createAsyncAction = AsyncAction('_PostStore.create');

  @override
  Future<bool> create() {
    return _$createAsyncAction.run(() => super.create());
  }

  final _$getPostsAsyncAction = AsyncAction('_PostStore.getPosts');

  @override
  Future<List<PostModel>> getPosts() {
    return _$getPostsAsyncAction.run(() => super.getPosts());
  }

  final _$_PostStoreActionController = ActionController(name: '_PostStore');

  @override
  void setId(int id) {
    final _$actionInfo =
        _$_PostStoreActionController.startAction(name: '_PostStore.setId');
    try {
      return super.setId(id);
    } finally {
      _$_PostStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
posts: ${posts},
idCategory: ${idCategory}
    ''';
  }
}
