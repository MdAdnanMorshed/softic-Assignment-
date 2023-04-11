import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../data/utiles/app_colors.dart';
import '../../../data/utiles/app_strings.dart';
import '../../../global_widgets/app_space.dart';
import '../../../global_widgets/customAppBarWidget.dart';
import '../../../global_widgets/custom_textform_field.dart';
import '../../../routes/app_pages.dart';
import '../controllers/authentication_controller.dart';
import 'dart:io';

class AuthenticationView extends GetView<AuthenticationController> {
  const AuthenticationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
            return openDialog();
        },
        child: SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              reverse: true,
              physics: const ScrollPhysics(),

              child: _buildLoginForm(context),
            ),
          ),
        ),
    );
  }

  Future<bool> openDialog() async{
    Get.dialog(
      AlertDialog(
        title:  Text('AreYorSure'),
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

  _buildLoginForm(context) {
    return Form(
      key: controller.loginFormKey,
      child: Column(
        children: [
          CustomAppBarWidget(AppStrings.signIn),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150.0,
                  height: 150.0,
                  child: Image.asset(
                    "assets/logo_without_text.png",
                    fit: BoxFit.fill,
                  ),
                ),
                AppSpace.spaceH30,

                CustomTextFormField(
                  prefixIcon: const Icon(Icons.person),
                  controller: controller.userNameController,
                  keyboardType: TextInputType.text,
                  hintText: "User Name",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter your user name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    controller.password.value = value!;
                  },
                ),
                AppSpace.spaceH16,
                CustomTextFormField(
                  prefixIcon: const Icon(Icons.lock),
                  obscureText: true,
                  controller: controller.passwordController,
                  hintText: "Password ",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Password';
                    } else if (value.length < 4) {
                      return 'Password must be 4 digit or more';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    controller.password.value = value!;
                  },
                ),
                AppSpace.spaceH26,
                _buildLoginBtn(context),

              ],
            ),
          ),

        ],
      ),
    );
  }


  _buildLoginBtn(context) {
    return InkWell(
      onTap: () {
        if (controller.loginFormKey.currentState!.validate()) {
          controller.loginFormKey.currentState!.save();
         // controller.loginController(context: context);
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 58.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.0),
          color: CtmColors.appColor,
        ),
        child: const Center(
          child: Text(
            AppStrings.signIn,
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
}
