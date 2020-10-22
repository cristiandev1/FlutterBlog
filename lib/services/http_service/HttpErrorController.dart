import 'package:flutter/material.dart';
import 'package:flutter_blog/widgets/bottom_sheet_error.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
part 'HttpErrorController.g.dart';

class HttpErrorController = _HttpErrorController with _$HttpErrorController;

abstract class _HttpErrorController with Store{
   ReactionDisposer reactionDisposer;

   _HttpErrorController(){
      reactionDisposer = autorun((_){
         if(error){
            Get.bottomSheet(
               BottomSheetError(errorMessage: errorMessage),
               backgroundColor: Colors.red,
               isDismissible: false,
            );
         }
      });
   }

   String errorMessage;

   @observable
   bool error;

   @action
   void showError(String msgError){
      error = false;
      error = true;
      errorMessage = msgError;
   }

   void dispose(){
      reactionDisposer();
   }
}