import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioHelper {
  static Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl:
            'http://algorithm.demo.carmartapp.com/Hiring-application/public/api/',
        receiveDataWhenStatusError: true,
        followRedirects: false,
        validateStatus: (status) {
          return status < 500;
        },
        headers: {
          // 'Accept': 'application/json',
        },
      ),
    );
  }

  static Future<Response> getData({
    @required String url,
    Map<String, dynamic> query,
    String token,
  }) async {
    dio.options.headers = {
      // 'Accept': 'application/json',
      'Authorization': 'Bearer $token' ?? '',
    };

    return await dio.get(
      url,
      queryParameters: query ?? null,
    );
  }


  static Future<Response> postData({
    @required String url,
    Map<String, dynamic> query,
    @required Map<String, dynamic> data,
    String token,
  }) async {
    dio.options.headers = {
      // 'Accept': 'application/json',
      // 'Authorization': token ?? '',
      'Authorization': 'Bearer $token' ?? '',
    };
    return await dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  
}
