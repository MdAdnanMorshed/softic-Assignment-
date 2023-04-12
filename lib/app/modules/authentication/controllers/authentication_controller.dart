import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';

import '../../../data/repositories/repo.dart';
import '../../../data/utiles/local_helper/cart_local_store.dart';
import '../../../routes/app_pages.dart';

class AuthenticationController extends GetxController {


  //TODO: Implement AuthenticationController
  var phoneNumber = ''.obs;
  var password = ''.obs;
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

   final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
  }

   @override
  void dispose() {
    // TODO: implement dispose
     userNameController.dispose();
     userNameController.clear();
   passwordController.clear();
   loginFormKey.currentState!.dispose();
    passwordController.dispose();
     super.dispose();
  }
  dynamic loginController({required BuildContext context}) async {
    try {
      final ProgressDialog progressDialog = DBHelper.loadingDialog(Get.overlayContext!);
      progressDialog.show();

      var resValue = await Repo().loginRepo(
          userName: userNameController.text, password: passwordController.text);

      int code= resValue.statusCode;
      print(code.runtimeType);
      print(resValue.statusCode);
      print('**************');
      var bodyMap = json.decode(resValue.body);


      if (code==200) {
        progressDialog.hide();
        bool isLogged = await DBHelper.object.setUserData(bodyMap);

        if(isLogged){
          progressDialog.hide();
          Get.toNamed(Routes.BOTTOMNAVIGATIONBAR);

        }
      }
      else {
        progressDialog.hide();
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Login has Wrong!')));
      }
      userNameController.clear();
      passwordController.clear();
    } catch (error) {

      if (kDebugMode) {
        print('AuthenticationController._loginController $error');
      }
    }
  }
}
