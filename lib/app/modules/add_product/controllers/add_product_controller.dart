import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../data/models/add_product_model.dart';
import '../../../data/repositories/repo.dart';
import '../../../routes/app_pages.dart';

class AddProductController extends GetxController {
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  var productNameController = TextEditingController();
  var productBarcodeController = TextEditingController();
  var productDescriptionController = TextEditingController();
  var productSubCategoryController = TextEditingController();
  var productBrandController = TextEditingController();

  var productQtyController = TextEditingController();
  var productUnitController = TextEditingController();
  var productUnitValueController = TextEditingController();
  var productPastQuantityController = TextEditingController();

  var productPriceController = TextEditingController();
  var productUnitPriceController = TextEditingController();
  var productMRPController = TextEditingController();
//
  final count = 0.obs;
  XFile? image1;

  /// product qty
  var quantity = ''.obs;
  var unit = ''.obs;
  var unitValue = ''.obs;
  var pastQuantity = ''.obs;

  /// product price
  var price = ''.obs;
  var unitPrice = ''.obs;
  var mrp = ''.obs;

  /// product Variable
  var productName = ''.obs;
  var barcode = ''.obs;
  var description = ''.obs;
  var image = ''.obs;
  var subCategory = ''.obs;
  var brand = ''.obs;

  final isCheckPolicyAgree = false.obs;

  dynamic addProductController({required BuildContext context}) async {
    if (registerFormKey.currentState!.validate()) {
      registerFormKey.currentState!.save();

      AddProductModel data = AddProductModel(
          name: productName.value,
          barcode: barcode.value,
          description: description.value,
          subCategory: 0,
          brand: 0,
          quantity: Quantity(
              quantity: int.parse(quantity.value),
              unit: unit.value,
              unitValue: unitValue.value,
              pastQuantity: int.parse(pastQuantity.value)),
          productPrice: ProductPrice(
              price: int.parse(price.value),
              unitPrice: int.parse(unitPrice.value),
              mrp: int.parse(mrp.value)));

      // print(
      //     'AddProductController.addProductController >>>>  ${jsonEncode(data)}');

      try {
        Repo()
            .addProductRepo(data: data, img: image1)
            .timeout(const Duration(seconds: 500))
            .then((value) {
          if (value) {
            print('product has been successful!');
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text(' product has been successful!')));
            Get.offAllNamed(Routes.AUTHENTICATION);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('product has Wrong!')));
          }
        }).onError((error, stackTrace) => null);

        productNameController.clear();
        productBarcodeController.clear();
        productDescriptionController.clear();
        productSubCategoryController.clear();
        productBrandController.clear();

        productQtyController.clear();
        productUnitController.clear();
        productUnitValueController.clear();
        productPastQuantityController.clear();

        productPriceController.clear();
        productUnitPriceController.clear();
        productMRPController.clear();
      } catch (e) {
        if (kDebugMode) {
          print('RegisterController.registerController error:$e');
        }
      }
    }
  }
}
