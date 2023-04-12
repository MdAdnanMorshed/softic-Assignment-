import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../data/utiles/app_colors.dart';
import '../data/utiles/local_helper/cart_local_store.dart';
import '../data/utiles/local_helper/shared_value_helper.dart';
import '../routes/app_pages.dart';

class CustomAppDrawer extends StatelessWidget {
  const CustomAppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Drawer(
      child: Container(

        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: CtmColors.appColor,

                  ),
                  child: Column(
                    children: [
                      Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(width: 2, color: Colors.yellow),
                            color: Colors.grey,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.red,
                                blurRadius: 15,
                                offset: const Offset(5, 5),
                              ),
                            ],
                          ),
                          child: Image.asset(
                            'assets/logo.png',
                            width: 50,
                            height: 50,
                            // color: Colors.green,
                          )
                          //Icon(Icons.person, size: 50, color: Colors.grey.shade300,),
                          ),
                      SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Company Name',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                      ),
                    ],
                  )),
            ),

            _buildDrawerMenuTitle(Icon(Icons.home, size: 18), 'Home', 1),
             _buildDrawerMenuTitle(Icon(Icons.app_registration, size: 18), 'Login', 2),

            _buildDrawerMenuTitle(Icon(Icons.phone, size: 18), 'Profile', 6),
            access_token.$ != ""
                ? _buildDrawerMenuTitle(
                    Icon(Icons.logout, size: 18), 'Logout'.tr, 0)
                : Container(),

            Spacer(),
            Column(
              children: [
                Text(
                  'copyright@2023',
                  style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                ),
                Text(
                  'version : 1.0.0',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: CtmColors.appColor),
                ),
              ],
            )

          ],
        ),
      ),
    ),
    );
  }

  _buildDrawerMenuTitle(Icon icon, String name, int number) {
    return ListTile(
      onTap: () {
        switch (number) {
          case 1:
            {
              Get.back();
              break;
            }
          case 2:
            {
              print('CustomAppDrawer._buildDrawerMenuTitle Register');

              Get.toNamed(Routes.AUTHENTICATION);
              break;
            }

          case 6:
            {
              Get.toNamed(Routes.UPDATE_PROFILE);
              print('CustomAppDrawer._buildDrawerMenuTitle Contact');
              break;
            }
          case 0:
            {
              print('CustomAppDrawer._buildDrawerMenuTitle logout');

              DBHelper.object.clearUserData();
              Get.offAndToNamed(Routes.AUTHENTICATION);
              break;
            }
        }
      },
      title: Text(
        name,
        style: TextStyle(
            fontWeight: FontWeight.w300, fontSize: 16, color: CtmColors.appColor),
      ),
      leading: CircleAvatar(
        backgroundColor: CtmColors.appColor,
        radius: 18,
        child: icon,
      ),
    );
  }

}
