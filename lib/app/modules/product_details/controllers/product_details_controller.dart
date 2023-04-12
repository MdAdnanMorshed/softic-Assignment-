import 'dart:convert';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../data/models/product_details_model.dart';
import '../../../data/models/product_model.dart';



class ProductDetailsController extends GetxController {
  //TODO: Implement ProductDetailsController

  final count = 0.obs;

  final selectedColor = 0.obs;

  final  productInfo= ProductModel().obs;




  final isLoadingData=false.obs;
  final isLoadingRelatedData=false.obs;

   final productId='0'.obs;





}
