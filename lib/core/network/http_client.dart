import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@singleton
class HttpClient {
  final Dio _dio;

  HttpClient(this._dio);

  void _addPublicHeaders(RequestOptions options) {
    options.headers[HttpHeaders.acceptHeader] = 'application/json';
  }

  void _addPrivateHeaders(RequestOptions options) {
    options.headers[HttpHeaders.acceptHeader] = 'application/json';
    options.headers[HttpHeaders.authorizationHeader] =
        'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyM2ZiMGE2OWFhYTA5N2I2MjJjNTM1NWE4NzY1MGE4OCIsIm5iZiI6MTcyNTI2OTU3OC43Nzc0ODksInN1YiI6IjY2ZDU4MTRkZmI1YTA0YjJhZTRjZGY1MCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.dWPnhRAcydKN4vcR74S4tLvnNilwTiRvUWJjK56Q9J8';
  }

  void _addPrivateInterceptors() async {
    // _dio.interceptors.add(PrettyDioLogger());
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      _addPrivateHeaders(options);
      return handler.next(options);
    }, onResponse: (response, handler) {
      if (response.statusCode! >= 400) {
        return handler.reject(DioException(response: response, requestOptions: response.requestOptions));
      }
      return handler.next(response);
    },
        onError: (error, handler) {
      debugPrint("Error $error");
    }));
  }

  void _addPublicInterceptor() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          _addPublicHeaders(options);
          return handler.next(options);
        },
      ),
    );
  }

  void _switchInterceptor(bool isSecure, [bool isRefresh = false]) {
    _dio.interceptors.clear();
    _dio.interceptors.add(LogInterceptor());

    if (isSecure) {
      _addPrivateInterceptors();
    } else {
      _addPublicInterceptor();
    }
  }

  Future<Response> get(
      String path, {
        Map<String, dynamic>? queryParameters,
        Options? options,
        void Function(int, int)? onReceiveProgress,
        bool isSecure = true,
        bool isRefresh = false,
      }) async {
    _switchInterceptor(isSecure, isRefresh);
    return await _dio.get(
      path,
      queryParameters: queryParameters,
      options: options,
      onReceiveProgress: onReceiveProgress,
    );
  }
}
