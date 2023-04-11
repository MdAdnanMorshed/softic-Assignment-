import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import '../../../data/utiles/app_colors.dart';
import '../../../data/utiles/app_strings.dart';
import '../../../global_widgets/app_space.dart';
import '../../../global_widgets/customAppBarWidget.dart';
import '../../../global_widgets/custom_textform_field.dart';

import '../../../routes/app_pages.dart';
import '../controllers/add_product_controller.dart';
import 'dart:io';
class AddProductView extends GetView<AddProductController> {
  const AddProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async {
        return openDialog();
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(

              children: [
                CustomAppBarWidget(AppStrings.addProduct,isBackButton: true,),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Padding(
                        padding: const EdgeInsets.only(top: 25.0, bottom: 15),
                        child: _buildAddProductForm(context)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );

  }

  Widget _buildAddProductForm( BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 1),
      width: MediaQuery.of(context).size.width / 1.15,
      child: Form(
        key: controller.registerFormKey,
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            AppSpace.spaceH12,
            CustomTextFormField(
              prefixIcon: const Icon(Icons.ac_unit),
              keyboardType: TextInputType.text,
              controller: controller.productNameController,
              hintText: 'Product Name ',
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter your product name';
                }
                return null;
              },
              onSaved: (value) {
                controller.productName.value = value!;
              },

            ),
            AppSpace.spaceH12,
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: CustomTextFormField(
                    prefixIcon: Icon(Icons.barcode_reader),
                    keyboardType: TextInputType.text,
                    controller: controller.productBarcodeController,
                    hintText: 'Bar Code',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter your product barcode';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      controller.barcode.value = value!;
                    },

                  ),
                ),
                Expanded(child: Container(
                    height: 45,

                    margin: EdgeInsets.symmetric(vertical: 0,horizontal: 5),
                    color: Colors.grey,
                    child: Icon(Icons.barcode_reader)))
              ],
            ),
            AppSpace.spaceH12,
            CustomTextFormField(

              keyboardType: TextInputType.text,
              prefixIcon: const Icon(Icons.description),
              controller: controller.productDescriptionController,


              hintText: 'Description',
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter your product description';
                }
                return null;

              },
              onSaved: (value) {
                controller.description.value = value!;
              },

            ),
            AppSpace.spaceH12,

            Text('SubCategory List Dropdown '),
            Text('Brand List Dropdown '),

            AppSpace.spaceH12,

            CustomTextFormField(

              keyboardType: TextInputType.number,
              prefixIcon: const Icon(Icons.cable),
              controller: controller.productQtyController,
              hintText: 'Quantity',

              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter your product quantity';
                }
                return null;
              },
              onSaved: (value) {
                controller.quantity.value = value!;
              },
              //obscureText: controller.isHidePassword ? false : true,
            ),
            AppSpace.spaceH12,
            CustomTextFormField(

              keyboardType: TextInputType.number,
              prefixIcon: const Icon(Icons.cable),
              controller: controller.productUnitController,
              hintText: 'Unit',

              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter your product unit';
                }
                return null;
              },
              onSaved: (value) {
                controller.unit.value = value!;
              },

            ),
            AppSpace.spaceH12,
            CustomTextFormField(

              keyboardType: TextInputType.number,
              prefixIcon: const Icon(Icons.cable),
              controller: controller.productUnitValueController,
              hintText: 'Unit Value',

              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter your product unit value ';
                }
                return null;
              },
              onSaved: (value) {
                controller.unitValue.value = value!;
              },

            ),
            AppSpace.spaceH12,
            CustomTextFormField(

              keyboardType: TextInputType.number,
              prefixIcon: const Icon(Icons.cable),
              controller: controller.productPastQuantityController,
              hintText: 'Past Quantity',

              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter your product past quantity';
                }
                return null;
              },
              onSaved: (value) {
                controller.pastQuantity.value = value!;
              },

            ),
            AppSpace.spaceH12,

            CustomTextFormField(

              keyboardType: TextInputType.number,
              prefixIcon: const Icon(Icons.cable),
              controller: controller.productPriceController,
              hintText: 'Price',

              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter your product price';
                }
                return null;
              },
              onSaved: (value) {
                controller.price.value = value!;
              },

            ),
            AppSpace.spaceH12,
            CustomTextFormField(
              keyboardType: TextInputType.number,

              prefixIcon: const Icon(Icons.cable),
              controller: controller.productUnitPriceController,
              hintText: 'Unit Price',

              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter your product unit price';
                }
                return null;
              },
              onSaved: (value) {
                controller.unitPrice.value = value!;
              },

            ),
            AppSpace.spaceH12,
            CustomTextFormField(

              prefixIcon: const Icon(Icons.cable),
              controller: controller.productMRPController,
              hintText: 'mrp ',
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter your product mrp price';
                }
                return null;
              },
              onSaved: (value) {
                controller.mrp.value = value!;
              },

            ),

            AppSpace.spaceH12,
            Row(
              children: [
                Expanded(
                    flex: 3,
                    child: Text('Image Upload ')),
                Expanded(child: InkWell(
                  onTap: (){
                    _imageEditPickerCameraAndGalleryAlert(context, controller);
                    print('AddProductView._buildAddProductForm Upload Image');
                  },
                  child: Container(
                     height: 50,


                    color: Colors.grey.shade300,
                    child: Icon(Icons.upload),),
                )),
              ],
            ),



            AppSpace.spaceH12,
            _addProductBtn(context),
            AppSpace.spaceH12,

          ],
        ),
      ),
    );
  }

  Widget _addProductBtn(context) {
    return GestureDetector(
      onTap: () {
        controller.addProductController(context: context);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 58.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.0),
          color: CtmColors.appColor,
        ),
        child: Center(
          child: Text(
            'Add Product',
            style: TextStyle(
              fontSize: 17.0,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
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
            onPressed: () => Get.toNamed(Routes.BOTTOMNAVIGATIONBAR),
            child:  Text('Home'.tr),
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

  Future<void> _imageEditPickerCameraAndGalleryAlert(BuildContext context,AddProductController controller) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(

          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                ConstrainedBox(
                  constraints: BoxConstraints.tightFor( height: 50),
                  child:ElevatedButton(
                    style:ButtonStyle() ,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children:const [
                        Text('Camera'),
                        AppSpace.spaceW20,
                        Icon(Icons.camera_alt_rounded)
                      ],
                    ),
                    onPressed: () async{
                      try {
                        final image = await ImagePicker().pickImage(source: ImageSource.camera);
                        print('path >>>>>>>>>>>>>>>>>>>> ${image!.path.toString()}');
                        if (image == null) return;

                        final imageTemp = File(image.path);

                         // controller.imagePath = imageTemp;

                      } on PlatformException catch (e) {
                        print("Failed to pick image: $e");
                      }
                    },
                  ),),
                AppSpace.spaceH16,
                ConstrainedBox(
                  constraints: BoxConstraints.tightFor( height: 50),
                  child: ElevatedButton(
                    style:ButtonStyle() ,
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children:const [
                        Text('Gallery'),
                        AppSpace.spaceW20,
                        Icon(Icons.image)
                      ],
                    ),
                    onPressed: () async{
                      try {
                        final image = await ImagePicker().pickImage(source: ImageSource.gallery);
                        print('path >>>>>>>>>>>>>>>>>>>> ${image!.path.toString()}');
                        if (image == null) return;

                        final imageTemp = File(image.path);

                        // controller.imagePath = imageTemp;

                      } on PlatformException catch (e) {
                        print("Failed to pick image: $e");
                      }
                    },
                  ),),
                AppSpace.spaceH20,
                ConstrainedBox(
                  constraints: BoxConstraints.tightFor( height: 50),
                  child: ElevatedButton(
                    style:ButtonStyle() ,
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children:const [
                        Text('Cancel',style: TextStyle(color: Colors.red),),
                        AppSpace.spaceW20,
                        Icon(Icons.cancel,color: Colors.red,)
                      ],
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),),


              ],
            ),
          ),

        );
      },
    );
  }
}
