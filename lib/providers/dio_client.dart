import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gallery_test_task/providers/endpoints/gallery_endpoints.dart';

class DioApi extends ChangeNotifier {
  Dio dio = Dio();

  late PhotoEndpoints photoEndpoints;

  final String baseUrl = 'https://api.unsplash.com';
  final String clientId = '896d4f52c589547b2134bd75ed48742db637fa51810b49b607e37e46ab2c0043';

  Future<void> init() async {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers.putIfAbsent(
            "Authorization",
            () => "Client-ID $clientId; ",
          );
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioError err, handler) {
          return handler.next(err);
        },
      ),
    );

    dio.options.baseUrl = baseUrl;

    photoEndpoints = PhotoEndpoints(dio);
  }
}

DioApi dioApi = DioApi();
