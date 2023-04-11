import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';

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

}
