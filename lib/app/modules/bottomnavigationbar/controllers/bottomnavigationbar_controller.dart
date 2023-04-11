
import 'package:flutter/foundation.dart';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:iv/app/data/repositories/repo.dart';
import '../../../data/models/product_details_model.dart';
import '../../../data/models/product_model.dart';


class BottomNavigationbarController extends GetxController
    with GetTickerProviderStateMixin {
  late TabController tapController;
  //late TabController tapController1;

  var sliderList = [].obs;
  var homeBaseSaleList = [].obs;
  var homeAllProductList = [].obs;
  var brandList = [].obs;
  var profileInfo = [].obs;
  var categories = [].obs;
  var hotCategories = [].obs;
  var subCategories = [].obs;
  final wishlist = [].obs;


  var productDetailsInfo = ProductDetailsModel().obs;
  final isLoadingDataAmountAddressApi = false.obs;
  final count = 1.obs;
  var index = 2.obs;
  final totalAmount = 0.obs;
  final sum = 0.obs;
  final wishId = ''.obs;
  final categoryById = ''.obs;
  final shippingCost = 1.obs;

  final isLoadingData = false.obs;
  final isLoadingGetWishData = false.obs;
  final isLoadingAddWishData = false.obs;
  final isLoadingRemoveWishData = false.obs;
  final isSelectItems = false.obs;
  var isSelectCategoryStatus = false.obs;
  final isCategoryActive = false.obs;
  var addressMethodInfo = [].obs;

  final isLoadingSubCategoriesData=false.obs;

  List<String> sliderImageHolders = [
    "assets/gameleven1.png",
    "assets/gameleven1.png",
  ].obs;

  @override
  void onInit() async {
    screens;


    //await homeAllProductsCTR1();


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

  onChangedTab(var inx) {
    index.value = inx;
  }

  final screens = <Widget>[
   // const NavHomeScreen(),
    Container(child: Text('abc'),),
    Container(child: Text('abc'),),
    Container(child: Text('abc'),),
    Container(child: Text('abc'),),
   /* const NavHomeScreen(),
    NavCartScreen(),
    NavCartScreen(),*/

  ];





  homeAllProductsCTR1() {
    print('BottomNavigationbarController.homeAllProductsCTR1 >>>>>>>>>>');
    Repo().homeAllProductRepo().then((resValue) async {
      var bodyMap = resValue;
      if (bodyMap != null) {
        for (var products in bodyMap) {
          homeAllProductList.add(ProductModel.fromJson(products));
        }
        if (kDebugMode) {
          print('All Product List  lng:${homeAllProductList.length}');
          print('BottomNavigationbarController.homeAllProductsCTR1@!!!!!!!!!!!!!');
        }
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print('All Product Error : $error');
        print('All Product Error : $stackTrace');
      }
    });
  }

  productDeleteById(pId)async{
     bool isCheck= await Repo().deleteProductRepo(pId);
       if(isCheck){
         print('product delete has done ');
    }else{

         print('product delete has wrong ');
       }
  }

}
