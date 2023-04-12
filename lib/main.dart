import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_value/shared_value.dart';
import 'app/data/utiles/app_colors.dart';
import 'app/data/utiles/app_strings.dart';

import 'app/data/utiles/local_helper/shared_value_helper.dart';
import 'app/init_first_controller/app_binding.dart';
import 'app/routes/app_pages.dart';

late SharedPreferences preferences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  preferences = await SharedPreferences.getInstance();

  if (preferences.getString(AppStrings.onBoardingKey) != AppStrings.valueStop) {
    preferences.setString(AppStrings.onBoardingKey, AppStrings.valueInit);
  }


  access_token.load().then(
    (value) {
      access_token.load();
      is_logged_in.load();
      print('is  token >> ${access_token.$}');

    },
  );

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
        statusBarIconBrightness:
            Brightness.light,
        statusBarColor: CtmColors.appColor
        ),
  );

  runApp(
    SharedValue.wrapApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        color: const Color(0xFF18042C),
        title: "Softic Assignment ",
        initialBinding: AppBinding(),
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,

        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: Colors.white),
            color: Colors.deepPurpleAccent,
          ),
        ),
      ),
    ),
  );
}
