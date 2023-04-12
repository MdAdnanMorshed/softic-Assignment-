

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/models/product_model.dart';
import '../../../data/models/user_profile_model.dart';
import '../../../data/repositories/repo.dart';
class UpdateProfileController extends GetxController {
  //TODO: Implement UpdateProfileController
  XFile? imagePick;
  final count = 0.obs;
  Rx<bool> isLoadingGetProfileData = false.obs;

  Rx<bool> isLoadingGetCountryData = false.obs;
  Rx<bool> isLoadingGetStateData = false.obs;




  var profileInfo = [].obs;

  var profileData=ProductModel().obs;

  var countryList = [].obs;
  var countryInitValue= ''.obs;
  var stateInitValue= ''.obs;
  var stateList = [].obs;

  @override
  void onInit() {
    print('UpdateProfileController.onInit');
    getProfileInfo();


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

  void increment() => count.value++;

  getProfileInfo()async{

    print('get profile Api Call >>> ');
    isLoadingGetProfileData.value=false;
    var profile= await Repo().getProfileRepo();

    var bodyMap = json.decode(profile.body);

      profileData.value=ProductModel.fromJson(bodyMap);

        if (kDebugMode) {
          print('UpdateProfileController.getProfileInfo${profileData.value.name.toString()}' );
      }
        isLoadingGetProfileData.value=true;


    isLoadingGetProfileData.value=true;
  }



}

