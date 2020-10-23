// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserStore on _UserStore, Store {
  final _$userGlobalAtom = Atom(name: '_UserStore.userGlobal');

  @override
  UserModel get userGlobal {
    _$userGlobalAtom.reportRead();
    return super.userGlobal;
  }

  @override
  set userGlobal(UserModel value) {
    _$userGlobalAtom.reportWrite(value, super.userGlobal, () {
      super.userGlobal = value;
    });
  }

  @override
  String toString() {
    return '''
userGlobal: ${userGlobal}
    ''';
  }
}
