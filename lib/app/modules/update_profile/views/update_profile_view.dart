
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
              if (controller.profileInfo != []) {
                if (controller.isLoadingGetProfileData.value) {
                  return ListView.builder(
                      itemCount: controller.profileInfo.length,
                      itemBuilder: (BuildContext ctx, int index) {
                        UserProfileModel uInfo = controller.profileInfo[index];


                        /// Updated

                        print('UpdateProfileView.build-->>> ${controller.countryInitValue.value}');




                        return SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomAppBarWidget(
                                'Update Profile',
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
                                            _buildBottomSheetPickerImageEditProfile(
                                                context);
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
                                        Positioned(
                                            bottom: 0,
                                            right: 0,
                                            child: InkWell(
                                              onTap: () {
                                                _buildBottomSheetPickerImageEditProfile(
                                                    context);
                                              },
                                              child: CircleAvatar(
                                                  backgroundColor:
                                                  Colors.grey.shade100,
                                                  radius: 18,
                                                  child: const Icon(
                                                    Icons.edit,
                                                    color: Colors.black,
                                                  )),
                                            )),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '${uInfo.firstName} ${uInfo.lastName}',
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
                              _headerProfileLine(context,
                                  'Personal Information', 'Edit', uInfo, 1),
                              _profileInfo('First Name', uInfo.firstName.toString()),
                              _profileInfo('Last Name', uInfo.lastName.toString()),
                              /* _profileInfo('Gender', 'Male'),
                              _profileInfo('Region ', 'Islam'),
                              _profileInfo('Date of Birth', '1/1/1995'),*/



                              SizedBox(height: 5),
                              _headerProfileLine(context, 'Contact Information',
                                  'Edit', uInfo, 2),

                              _profileInfo('Mail', uInfo.email.toString()),




                            ],
                          ),
                        );
                      });
                } else {
                  return Center(child: const CircularProgressIndicator());
                }
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            })),
      ),
    );
  }

  _headerProfileLine(context, leftTitle, rightTitle, data, int id) {
    return InkWell(
      onTap: () {
        //
        if (id == 1) {
          /// personal info update
          _buildBottomSheetCreateAddressCheckOut(context, data);
        } else {
          /// contact info update
          _buildBottomSheetUpdateContact(context, data);
        }
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
              Text(
                rightTitle,
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Colors.deepOrangeAccent,
                  fontWeight: FontWeight.w700,
                  height: 1.5,
                ),
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

  /// Profile Update  Address  BottomSheet
  _buildBottomSheetCreateAddressCheckOut(context, UserProfileModel data) {

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
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _headLineText(headName: 'First Name'),
                          _customInputFieldBottomSheet(
                              data.firstName.toString(),
                              controller.firstNameCTR,
                              TextInputType.text),
                        ],
                      ),
                    ),
                    AppSpace.spaceW10,
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _headLineText(headName: 'Last Name'),
                          _customInputFieldBottomSheet(
                              data.lastName.toString(),
                              controller.lastNameCTR,
                              TextInputType.text),
                        ],
                      ),
                    )
                  ],
                ),
                AppSpace.spaceH16,
                _headLineText(headName: 'Address'),


                AppSpace.spaceH16,

                Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _headLineText(headName: 'City'),
                          _customInputFieldBottomSheet('data.city.toString()',
                              controller.cityCTR, TextInputType.text),
                        ],
                      ),
                    ),
                    AppSpace.spaceW16,
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _headLineText(headName: 'ZIP'),
                          _customInputFieldBottomSheet('data.zip.toString()',
                              controller.zipCTR, TextInputType.number),
                        ],
                      ),
                    )
                  ],
                ),
                AppSpace.spaceH16,
                _headLineText(headName: 'Country'),
                _countryListDropDown('data.country.toString()'),
                AppSpace.spaceH16,
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _headLineText(headName: 'State'),
                    _stateListDropDown('data.state.toString()'),

                    /// Drop Down
                  ],
                ),
                AppSpace.spaceH16,
                ElevatedButton(
                  onPressed: () {
                    print('Update Profile Click ');
                    Get.back();
                    final ProgressDialog progressDialog = DBHelper.loadingDialog(Get.overlayContext!);
                    progressDialog.show();

                    Timer(const Duration(seconds: 3), () {
                      progressDialog.hide();
                    });
                    print(controller.lastNameCTR.text);
                    // controller.userUpdateController(context: context);

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CtmColors.appColor,
                    minimumSize: const Size.fromHeight(50),
                  ),
                  child: Text(
                    'Update Profile'.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                      height: 1.36,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  /// contact Update BottomSheet
  _buildBottomSheetUpdateContact(context, UserProfileModel data) {
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
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _headLineText(headName: 'Email'),
                _customInputFieldBottomSheet(data.email.toString(),
                    controller.emailCTR, TextInputType.text),
                AppSpace.spaceH16,
                _headLineText(headName: 'Contact Number'),
                _customInputFieldBottomSheet('data.mobile.toString()',
                    controller.contactCTR, TextInputType.number),
                AppSpace.spaceH16,
                ElevatedButton(
                  onPressed: () {
                    print('Update Profile Click ');
                    Get.back();
                    final ProgressDialog progressDialog = DBHelper.loadingDialog(Get.overlayContext!);
                    progressDialog.show();

                    Timer(const Duration(seconds: 3), () {
                      progressDialog.hide();
                    });
                 //   controller.userUpdateController(context: context);
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CtmColors.appColor,
                    minimumSize: const Size.fromHeight(50),
                  ),
                  child: Text(
                    'Update Profile'.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                      height: 1.36,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
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

  _countryListDropDown(String countryId) {
    return Obx(() {
      if (controller.countryList.isEmpty) {
        return const Text('');
      } else {
        return DropdownButton(
          isExpanded: true,
          underline: const SizedBox(),
          isDense: true,
          value:  controller.countryInitValue.value==''?controller.countryList[0].id : controller.countryInitValue.value, // controller.countryInitValue.value,
          hint: const Text("Select Country ",
              style: TextStyle(
                fontWeight: FontWeight.w300,
              )),
          items: controller.countryList.map((country) {

            return DropdownMenuItem(
              value: country.id,
              child: Text(
                country.name.toString(),
                maxLines: 1,
                overflow: TextOverflow.clip,
                style: const TextStyle(fontSize: 12),
              ),
            );
          }).toList(),
          onChanged: (countryFormId) {
            controller.countryInitValue.value = countryFormId.toString();
            controller.country = countryFormId.toString();

            ///Updated
            controller.stateInitValue.value = '';


           // controller.getStateByCountryIdController();

            print("You selected Country Id : ${controller.countryInitValue.value}");
          },
        );
      }
    });
  }

  /// State List UI 80% (testing )
  _stateListDropDown(String stateId) {
    return Obx(() {
      if (controller.stateList.isEmpty) {
        return Container();
      } else {
        return DropdownButton(
          isExpanded: true,
          underline: const SizedBox(),
          isDense: true,
          value: controller.stateInitValue.value==''? controller.stateList[0].id : controller.stateInitValue.value,
          hint: const Text("Select State ",
              style: TextStyle(
                fontWeight: FontWeight.w300,
              )),
          items: controller.stateList.map((stateInfo) {
            return DropdownMenuItem(
              value: stateInfo.id,
              child: Text(
                stateInfo.name.toString(),
                maxLines: 1,
                overflow: TextOverflow.clip,
                style: const TextStyle(fontSize: 12),
              ),
            );
          }).toList(),
          onChanged: (countryFormId) {
            controller.stateInitValue.value = countryFormId.toString();
            print("You selected State Id   : $countryFormId");
          },
        );
      }
    });
  }
}
