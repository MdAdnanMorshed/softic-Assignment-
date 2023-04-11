import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart' as connectivity;
import 'package:flutter/foundation.dart';

import 'package:get/get.dart';
import 'package:iv/app/data/models/product_model.dart';
import 'package:iv/app/data/utiles/local_helper/shared_value_helper.dart';

import '../data/repositories/repo.dart';



class InitFirstController extends GetxController  with GetTickerProviderStateMixin {

  var homeAllProductList = [].obs;


  @override
  void onInit() async {
    if(access_token.$!=''){
      homeAllProductsCTR();
      getProfile();
    }
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  homeAllProductsCTR() {
    Repo().homeAllProductRepo().then((resValue) async {
      var bodyMap = resValue;
      if (bodyMap != null) {
        for (var products in bodyMap) {
          homeAllProductList.add(ProductModel.fromJson(products));
        }
        if (kDebugMode) {
          print('All Product List  lng:${homeAllProductList.length}');
        }
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print('All Product Error : $error');
        print('All Product Error : $stackTrace');
      }
    });
  }

  Future getProfile()async{
    var resValue =await Repo().getProfileRepo();
      var bodyMap = resValue;
      if (bodyMap != null) {
        if (kDebugMode) {
          print('InitFirstController.getProfile');
        print(bodyMap);
      }
      }

  }


}
