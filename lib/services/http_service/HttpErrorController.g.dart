// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HttpErrorController.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HttpErrorController on _HttpErrorController, Store {
  final _$errorAtom = Atom(name: '_HttpErrorController.error');

  @override
  bool get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(bool value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$_HttpErrorControllerActionController =
      ActionController(name: '_HttpErrorController');

  @override
  void showError(String msgError) {
    final _$actionInfo = _$_HttpErrorControllerActionController.startAction(
        name: '_HttpErrorController.showError');
    try {
      return super.showError(msgError);
    } finally {
      _$_HttpErrorControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
error: ${error}
    ''';
  }
}
