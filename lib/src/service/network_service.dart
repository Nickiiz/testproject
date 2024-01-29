// ignore_for_file: prefer_const_declarations

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:learn_flutter_fullstack/src/constants/api.dart';
import 'package:learn_flutter_fullstack/src/models/post.dart';
import 'package:learn_flutter_fullstack/src/models/product.dart';

class NetworkService {
  NetworkService._internal();

  static final NetworkService _instance = NetworkService._internal();

  factory NetworkService() => _instance;
  static final _dio = Dio()
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: (
          RequestOptions options,
          RequestInterceptorHandler handler,
        ) {
          return handler.next(options);
        },
        onResponse: (
          Response response,
          ResponseInterceptorHandler handler,
        ) {
          return handler.next(response);
        },
        onError: (
          DioException error,
          ErrorInterceptorHandler handler,
        ) {
          return handler.next(error);
        },
      ),
    );
  Future<List<Product>> getAllProduct(int startIndex, {int limit = 10}) async {
    final url = '${API.BASE_URL}${API.PRODUCT}';
    print(url);

    final Response response =
        await _dio.get(url, options: Options(headers: {}));
    if (response.statusCode == 200) {
      return productFromJson(jsonEncode(response.data));
    }
    throw Exception('Network Failed');
  }

  // Future<List<Post>> fetchPosts(int startIndex, {int limit = 10}) async {
  //   final url =
  //       'https://jsonplaceholder.typicode.com/posts?_start=$startIndex&_limit=$limit';
  //   final Response response = await _dio.get(url);
  //   if (response.statusCode == 200) {
  //     return postFromJson(jsonEncode(response.data));
  //   }
  //   throw Exception('Network Failed');
  // }
}
