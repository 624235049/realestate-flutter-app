import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import 'package:http_parser/http_parser.dart';
import 'package:miniproject/src/configs/api.dart';
import 'package:miniproject/src/model/ApmModel.dart';
import 'package:miniproject/src/model/CondoModel.dart';
import 'package:miniproject/src/model/DmModel.dart';


class NetworkService{
  NetworkService._internal();

  static final NetworkService _instace = NetworkService._internal();

  factory NetworkService() => _instace;

  static final Dio _dio = Dio();


  Future<String> validateUserLoginDio(String username, String password) async {
    FormData data = FormData.fromMap({
      'username': username,
      'password': password,
    });
    try {
      //var url = API.BASE_URL + '/flutterapp/f_user_login.php';
      //var url = API.BASE_URL + '/api/user';
      var url = API.BASE_URL + '/flutterapi/api/user';
      final response = await _dio.post(url, data: data);
      if (response.statusCode == 200) {
        var jsonString = response.data;
        // var jsonMap = json.encode(jsonString);
        String username = jsonString["username"];
        print('username = ' + username);
        String password = jsonString["password"];
        print('password = ' + password);
        if (username != 'failed') {
          return 'pass';
        } else {
          return 'failed';
        }
      } else {
        return 'failed';
      }
    } catch (Exception) {
      throw Exception('Network failed');
    }
  }

  // Future<String> deleteGameDio(String id) async {
  //   final response = await _dio.delete(API.BASE_URL + API.GAME + '/' + id);
  //
  //   if (response.statusCode == 200) {
  //     if (response.data > 0) {
  //       return 'Delete Successfully';
  //     } else {
  //       return 'Delete Failed';
  //     }
  //   }
  //   throw Exception('Network failed');
  // }

  Future<CondoModel> getAllCondoDio() async {
    //var url = API.BASE_URL + '/flutterapp/getAllGames_7.php';
    var url = API.BASE_URL + API.CONDO;
    print('url getAllCondoDio() = ' + url);
    final response = await _dio.get(url);
    if (response.statusCode == 200) {
      print(response.data);
      return condoModelFromJson(json.encode(response.data));
    }
    throw Exception('Network failed');
  }

  Future<ApmModel> getAllApmDio() async {
    //var url = API.BASE_URL + '/flutterapp/getAllGames_7.php';
    var url = API.BASE_URL + API.APARTMENT;
    print('url getAllApmDio() = ' + url);
    final response = await _dio.get(url);
    if (response.statusCode == 200) {
      print(response.data);
      return ApmModelFromJson(json.encode(response.data));
    }
    throw Exception('Network failed');
  }


  Future<DmModel> getAllDmDio() async {
    //var url = API.BASE_URL + '/flutterapp/getAllGames_7.php';
    var url = API.BASE_URL + API.DORMITORY;
    print('url getAllDmDio() = ' + url);
    final response = await _dio.get(url);
    if (response.statusCode == 200) {
      print(response.data);
      return dmModelFromJson(json.encode(response.data));
    }
    throw Exception('Network failed');
  }

  Future<String> editCondoDio(File imageFile, Condo condo) async {
    FormData data = FormData.fromMap({
      'condo_name': condo.condoName,
      'condo_price': condo.condoPrice,
      'condo_detail': condo.condoDetail,
      'condo_img': condo.condoImage,

      // if (imageFile != null)
      //   'photo': await MultipartFile.fromFile(
      //     imageFile.path,
      //     contentType: MediaType('image', 'jpg'),
      //   ),
      if (imageFile != null)
        'condo_img': condo.condoImage
      else
        'condo_img': 'no_image',
      if (imageFile != null)
        'photo': await MultipartFile.fromFile(
          imageFile.path,
          contentType: MediaType('image', 'jpg'),
        ),
    });

    final response =
    await _dio.post(API.BASE_URL + API.CONDO + '/' + condo.condoId, data: data);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.data);
      if (response.data > 0) {
        return 'Edit Successfully';
      } else {
        return 'Edit Failed';
      }
    }
    throw Exception('Network failed');
  }

  Future<String> addCondoDio(File imageFile, Condo condo) async {
    FormData data = FormData.fromMap({
      'condo_id': condo.condoId,
      'condo_name': condo.condoName,
      'condo_price': int.parse(condo.condoPrice),
      'condo_detail': condo.condoDetail,
      //'game_img': game.gameImg,

      if (imageFile != null)
        'condo_img': 'has_image'
      else
        'condo_img': 'no_image',
      if (imageFile != null)
        'photo': await MultipartFile.fromFile(
          imageFile.path,
          contentType: MediaType('image', 'jpg'),
        ),
    });
    try {
      final response = await _dio.post(API.BASE_URL + API.CONDO, data: data);
      print(response);
      if (response != null) {
        if (response.statusCode == 200) {
          print(response.data);
          if (response.data > 0) {
            return 'Add Successfully';
          } else {
            return 'Add Failed';
          }
        }
      } else {
        print('response is nulllllll');
      }
    } catch (DioError) {
      print('Exception --> response is nulllllll');
      print(DioError.toString());
      throw DioError();
    }
  }



}//end class