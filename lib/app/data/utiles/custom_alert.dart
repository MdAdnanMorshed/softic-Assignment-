import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'app_colors.dart';

class CustomAlert {

  static pleaseEntryField() {
    Get.snackbar(
      'Error',
      'Please Entry Field',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
    );
  }

  static addToCartAlert() {
    Get.snackbar(
      'Cart',
      'Item has been added',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
    );
  }

  static selectProductAlert() {
    Get.snackbar(
      'Alert',
      'Please Select Product to Checkout',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.orange,
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
    );
  }

  static stockOutAlert() {
    Get.snackbar(
      'Not Enough Product In Stock.',
      '',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
    );
  }

  static selectShippingMethodAlert() {
    Get.snackbar(
      'Alert',
      'Please Select your Shipping Method !',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
    );
  }

  static createShippingMethodAlert() {
    Get.snackbar(
      'Alert',
      'First Create Address',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
    );
  }

  static orderSuccessAlert() {
    Get.snackbar(
      'Order has not successful...',
      'try to again please',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
    );
  }

  static couponErrorAlert(String title) {
    Get.snackbar(
      'Error',
      title,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
    );
  }

  static errorAlert(String title) {
    Get.snackbar(
      'Error',
      title,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
    );
  }

  static couponSuccessAlert() {
    Get.snackbar(
      'Order has not successful...',
      'try to again please',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
    );
  }

  static submitFailedAlert() {
    Get.snackbar(' Messages Alert ', 'Submitting has failed !',
        snackPosition: SnackPosition.TOP,
        margin: EdgeInsets.all(Get.width * 0.5),
        backgroundColor: CtmColors.appColor,
        colorText: Colors.red);
  }

  static missMatchAlert() {
    Get.snackbar(
      'newConfirmPassMatch'.tr,
      'PleaseTryAgain'.tr,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.white,
      colorText: Colors.red,
      duration: const Duration(seconds: 4),
    );
  }

  void showSnackBar(BuildContext context) {
    final snackBar = SnackBar(
        content: Text('Hi, Flutter developers'),
        backgroundColor: Colors.teal,
        shape: StadiumBorder());
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}
