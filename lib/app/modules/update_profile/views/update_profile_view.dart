
import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import '../../../data/models/user_profile_model.dart';
import '../../../data/utiles/api_url.dart';
import '../../../data/utiles/app_colors.dart';
import '../../../data/utiles/local_helper/cart_local_store.dart';
import '../../../global_widgets/app_space.dart';
import '../../../global_widgets/customAppBarWidget.dart';
import '../controllers/update_profile_controller.dart';

class UpdateProfileView extends GetView<UpdateProfileController> {
   UpdateProfileView({Key? key}) : super(key: key);
  XFile? img;
  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Scaffold(
        body: Container(
            alignment: Alignment.topLeft,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey.shade100,
            child: Obx(() {

                if (controller.isLoadingGetProfileData.value) {

                return  SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomAppBarWidget(
                        'Profile',
                        isBackButton: true,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 186.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF9D9D9D)
                                  .withOpacity(0.16),
                              offset: Offset(0, 0),
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                InkWell(
                                  onTap: () {

                                  },
                                  child: CircleAvatar(
                                    radius: 50,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade100,
                                          borderRadius:
                                          BorderRadius.circular(60),
                                          image: DecorationImage(
                                              image: NetworkImage(''),
                                              fit: BoxFit.cover)),
                                      // child: const Center(child: Text("dfdfd")),
                                    ),
                                  ),
                                ),

                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'data',
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: Color(0xFF404040),
                                fontWeight: FontWeight.w700,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5),
                      _headerProfileLine(context, 'Personal Information'),
                      _profileInfo('First Name', controller.profileData.value.name.toString()),
                      _profileInfo('Last Name', 'last name'),
                      /* _profileInfo('Gender', 'Male'),
                              _profileInfo('Region ', 'Islam'),
                              _profileInfo('Date of Birth', '1/1/1995'),*/



                      SizedBox(height: 5),
                      _headerProfileLine(context, 'Contact Information'),

                      _profileInfo('Mail', 'edd'),




                    ],
                  ),
                );
                } else {
                  return Center(child: const CircularProgressIndicator());
                }

            })),
      ),
    );
  }

  _headerProfileLine(context, leftTitle) {
    return InkWell(
      onTap: () {

      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50.0,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF9D9D9D).withOpacity(0.16),
              offset: Offset(0, 0),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Padding(
          padding:
          const EdgeInsets.only(left: 20, top: 8.0, bottom: 8.0, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                leftTitle,
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Color(0xFF404040),
                  fontWeight: FontWeight.w700,
                  height: 1.5,
                ),
              ),
              const SizedBox(
                height: 5,
              ),

            ],
          ),
        ),
      ),
    );
  }

  _profileInfo(String profileKey, String profileValue) {
    print('UpdateProfileView._profileInfo---> ${profileValue}');

    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 10, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              profileKey,
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              ' :     ' + profileValue,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }





  _customInputFieldBottomSheet(String hintName, TextEditingController inputController, TextInputType? keyboardTyp) {
    return TextFormField(
      controller: inputController,
      keyboardType: keyboardTyp,
      decoration: InputDecoration(
          contentPadding:
          const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          border: const OutlineInputBorder(),
          hintText: hintName,
          hintStyle: const TextStyle(fontSize: 14,color: Colors.black)),
      onTap: () {
        /// Save
      },
      //validator: (value){},
    );
  }

  _buildBottomSheetPickerImageEditProfile(context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.zero,
              topLeft: Radius.circular(30), //Radius.zero,
              //bottomRight: Radius.circular(20),
              topRight: Radius.circular(30)),
          side: BorderSide(width: 1, color: CtmColors.appColor)),
      context: context,
      builder: (context) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppSpace.spaceH16,
                _headLineText(
                    headName: 'Please Select your Image Picker Options'),
                AppSpace.spaceH16,
                InkWell(
                  onTap: () {
                    _uploadCameraGalleryPicker(ImageSource.camera,context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10)
                      // color: Colors.grey

                    ),
                    child:  ListTile(
                        title: const Text(
                          'Upload your image from camera',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        leading: CircleAvatar(
                            radius: 15,
                            backgroundColor:
                            CtmColors.appColor,
                            child: const Icon(
                              Icons.camera_alt_outlined,
                              size: 25,
                            ))),
                  ),
                ),
                AppSpace.spaceH16,
                InkWell(
                  onTap: () {

                    _uploadCameraGalleryPicker(ImageSource.gallery,context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10)
                      // color: Colors.grey

                    ),
                    child:  ListTile(
                        title: const Text(
                          'Upload your image from gallery',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        leading: CircleAvatar(
                            radius: 15,
                            backgroundColor: CtmColors.appColor,
                            child: const Icon(
                              Icons.upload,
                              size: 25,
                            ))),
                  ),
                ),
                AppSpace.spaceH16,
              ],
            ),
          ),
        );
      },
    );
  }

  _headLineText({required String headName}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Text(
        headName,
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: CtmColors.appColor),
      ),
    );
  }


   Future _uploadCameraGalleryPicker(ImageSource pickerSource,context) async {
     try {
       controller.imagePick = await ImagePicker().pickImage(source: pickerSource);
       if (controller.imagePick == null) return;
       print('Image Path :${controller.imagePick!.path}');
       img = controller.imagePick!;


       Get.back();
       final ProgressDialog progressDialog = DBHelper.loadingDialog(Get.overlayContext!);
       progressDialog.show();

       Timer(const Duration(seconds: 3), () {
         progressDialog.hide();
       });


    //   controller.userUpdateController(context: context);
     } catch (e) {
       print('Failed to pick image: $e');
     }
   }


}
