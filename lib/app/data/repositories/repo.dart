import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import '../utiles/api_url.dart';
import 'package:http/http.dart' as http;

import '../utiles/local_helper/shared_value_helper.dart';

class Repo {
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

  /// onGoing


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


  addProductRepo({required Map rgMapBody,   XFile? img}) async {
    print('Image Path REPO >>> ${img}');
    print('product >>> ${rgMapBody}');
    var request = http.MultipartRequest('POST', Uri.parse('https://secure-falls-43052.herokuapp.com/api/create-products'));

    Map<String, dynamic> qtyBody = {
      'quantity': rgMapBody['quantity'],
      'unit': rgMapBody['unit'],
      'unitValue': rgMapBody['unitValue'],
      'pastQuantity': rgMapBody['pastQuantity'],
    };

    Map<String, dynamic> priceBody = {
      'price': rgMapBody['price'],
      'unitPrice': rgMapBody['unitPrice'],
      'mrp':rgMapBody['mrp'],
    };

    print('priceBody ${jsonEncode(priceBody)}');
    print('qtyBody ${jsonEncode(qtyBody)}');

    request.fields.addAll({
      'user_id': rgMapBody['user_id'],
    'name': rgMapBody['name'],
    'barcode':rgMapBody['barcode'],
    'description': rgMapBody['description'],

    'subCategory': rgMapBody['subCategory'],
    'brand': rgMapBody['brand'],
    'quantity': jsonEncode(qtyBody),
    'productPrice': jsonEncode(priceBody),
    });


    var imagePath = await http.MultipartFile.fromPath('image', img!.path);

    request.files.add(imagePath);


    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      print("uploaded Upload done >>> ${response.statusCode}");
      return true;
    } else {
      print(await response.stream.bytesToString());
      print("uploaded Upload else >>>${response.statusCode}");
      print(response.reasonPhrase);
      return false;
    }
  }
}
