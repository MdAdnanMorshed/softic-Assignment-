import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iv/app/data/models/add_product_model.dart';
import '../utiles/api_url.dart';
import 'package:http/http.dart' as http;

import '../utiles/local_helper/shared_value_helper.dart';

class Repo extends GetConnect {
  @override
  void onInit() {}

  ///done
  Future loginRepo({required String userName, required String password}) async {
    const String apiUrl = ApiURL.loginUrl;
    if (kDebugMode) {
      print(apiUrl);
    }

    Map<String, dynamic> bodyData = {
      'username': userName,
      'password': password,
      'rememberMe': true.toString()
    };

    print('login bodyData >> $bodyData');

    try {
      var response = await http.post(Uri.parse(apiUrl),
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode(bodyData));

      if (kDebugMode) {
        print(response.statusCode);
        print(response.body);
      }
      return response;
    } catch (error) {
      if (kDebugMode) {
        print('login usr $error');
      }
    }
  }

  ///done
  Future homeAllProductRepo() async {
    Uri apiUrl = Uri.parse(
        'https://secure-falls-43052.herokuapp.com/api/products?page=0&size=20');
    if (kDebugMode) {
      print(apiUrl);
      print(access_token.$);
    }

    try {
      final response = await http.get(apiUrl, headers: {
        'Content-Type': 'application/json',
        "Authorization": "Bearer ${access_token.$}",
      });
      if (kDebugMode) {
        print('All Product API ');
        print(response.statusCode);
        print(response.body);
      }

      return json.decode(response.body);
    } on Exception catch (exception) {
      if (kDebugMode) {
        print(exception);
      }
    } catch (error) {
      print('best sale error >>> $error');
      throw Exception(error);
    }
  }

  /// onGoing 90%
  Future deleteProductRepo(String id) async {
    Uri apiUrl =
        Uri.parse('https://secure-falls-43052.herokuapp.com/api/products/$id');
    if (kDebugMode) {
      print(apiUrl);
      print(access_token.$);
    }

    try {
      final response = await http.delete(apiUrl, headers: {
        'Content-Type': 'application/json',
        "Authorization": "Bearer ${access_token.$}",
      });
      if (kDebugMode) {
        print('All Product API Delete  ');
        print(response.statusCode);
        print(response.body);
      }

      if (response.statusCode == 200) {
        return true;
      } else {
        print(response.body);
        return false;
      }
    } on Exception catch (exception) {
      if (kDebugMode) {
        print(exception);
      }
    } catch (error) {
      print('best sale error >>> $error');
      throw Exception(error);
    }
  }

  /// done
  Future getProfileRepo() async {
    Uri apiUrl =
        Uri.parse('https://secure-falls-43052.herokuapp.com/api/account');
    if (kDebugMode) {
      print(apiUrl);
      print(access_token.$);
    }
    try {
      final response = await http.get(apiUrl, headers: {
        'Content-Type': 'application/json',
        "Authorization": "Bearer ${access_token.$}",
      });
      if (kDebugMode) {
        print('All Product API ');
        print(response.statusCode);
        print(response.body);
      }

      return response;
    } on Exception catch (exception) {
      if (kDebugMode) {
        print(exception);
      }
    } catch (error) {
      print('best sale error >>> $error');
      throw Exception(error);
    }
  }

  /// onGoing 95%
  addProductRepo({required AddProductModel data, required XFile? img}) async {
    postStartDayTripWithImage(file: img!, data: data);
    print('Image Path REPO >>> ${img!.path.toString()}');
    print(' tojson >>> ${data.toJson()}');
  /*  Map<String, String> headers = {
      'Content-Type': 'application/json',
      "Authorization": "Bearer ${access_token.$}",
    };
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://secure-falls-43052.herokuapp.com/api/create-products'));

    request.fields.addAll({jsonEncode(data.toJson())} as Map<String, String>);

    request.headers.addAll(headers);
    var imagePath =
        await http.MultipartFile.fromPath('image', img.path.toString());

    request.files.add(imagePath);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      print("status code >>> ${response.statusCode}");
      return true;
    } else {
      print(await response.stream.bytesToString());
      print("status code else >>>${response.statusCode}");
      print(response.reasonPhrase);
      return false;
    }*/
  }

  Future<bool?> postStartDayTripWithImage({

    required XFile file,
    required AddProductModel data,
  }) async {
    const String apiUrl = "https://secure-falls-43052.herokuapp.com/api/create-products";

    Map<String, String> header = {"Authorization": "Bearer ${access_token.$}"};
    final FormData formData = FormData({
      "name": "ab",
      "barcode": "abc",
      "description": "as",
      "image": MultipartFile(file.path, filename: file.path.split("/").last),
      "subCategory": 1851,
      "brand": 1901,
      "quantity": jsonEncode(data.quantity) ,
      "productPrice":jsonEncode( data.productPrice)
    });
    print(formData.files.toString());
    try {
      final Response response = await GetConnect().post(
        apiUrl,
        formData,
        headers: header,
      );
      print('response.body===========');
      print(response.statusCode);

      print(response.body);
      print('response.body');
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {}

    return null;
  }
}
