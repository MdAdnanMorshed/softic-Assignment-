import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/bottomnavigationbar_controller.dart';
import 'nav_home_screen.dart';

class BottomnavigationbarView extends GetView<BottomNavigationbarController> {
  const BottomnavigationbarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async {
        if(controller.index.value==2){
          return openDialog();
        }else{
          controller.index.value=2;
        }
       return false;
      },
      child: const Scaffold(
        body: NavHomeScreen(),


      ),
    );
  }
   Future<bool> openDialog() async{
    Get.dialog(
      AlertDialog(
        title:  Text('AreYorSure'.tr),
        content:  Text('DoYouWantToExitThisApp'.tr),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child:  Text('No'.tr),
          ),
          TextButton(
            onPressed: () {
              if (Platform.isAndroid) {
                exit(0);
              } else if (Platform.isIOS) {
                exit(0);
              }
            },
            child:  Text('Yes'.tr),
          ),
        ],
      ),
    );
    return false;
  }
}
