import 'package:flutter/material.dart';

import 'package:get_storage/get_storage.dart';
import 'package:iv/app/data/utiles/local_helper/shared_value_helper.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';

import '../../models/user_info_model.dart';
import '../app_colors.dart';

class DBHelper {
  static DBHelper object = DBHelper._();

  DBHelper._();

  static ProgressDialog? pr;

  static dynamic loadingDialog(BuildContext context) {
    pr = ProgressDialog(context);
    pr = ProgressDialog(context,
        type: ProgressDialogType.normal, isDismissible: false, showLogs: true);
    pr!.style(
        message: "Wait for a few seconds ...",
        borderRadius: 5.0,
        backgroundColor: Colors.white,
        progressWidget: Container(
          padding: const EdgeInsets.all(10),
          child:  CircularProgressIndicator(
            backgroundColor: Colors.grey,
            color: CtmColors.appColor,
          ),
        ),
        elevation: 10.0,
        insetAnimCurve: Curves.fastOutSlowIn,
        progress: 0.0,
        maxProgress: 100.0,
        progressTextStyle: const TextStyle(
          color: Colors.red,
          fontSize: 13.0,
          fontWeight: FontWeight.w400,
        ),
        messageTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 15.0,
          fontWeight: FontWeight.w600,
        ));
    return pr;
  }


  /// Local Login Save
  Future<bool> setUserData(loginResponse) async {

    var token = loginResponse['id_token'];

    is_logged_in.$ = true;
    is_logged_in.save();



    access_token.$ = token;
    access_token.save();

    print('Local Store UserId With Is Logged ');
    print('${is_logged_in.$}');
    print('${user_id.$}');
    return true;
  }

  /// Local login clear
  clearUserData() {
    is_logged_in.$ = false;
    is_logged_in.save();
    access_token.$ = "";
    access_token.save();

  }
}


