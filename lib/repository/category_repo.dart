import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:pie_solution/api/api_uris.dart';
import 'package:pie_solution/api/exceptions.dart';
import 'package:pie_solution/model/category_model.dart';
import 'package:pie_solution/repository/repository.dart';

class CategoryRepository extends Repository {
  final _dio = dio.Dio();
  @override
  Future fetch() async {
    try {
      final response = await _dio.get(API.URI);
      if (response.statusCode == 200) {
        final categories = response.data["categories"] as List;
        final items = categories.map((e) => Category.fromJson(e)).toList();

        print("cat $items");
        return items;
      }
      throw ApiException("Something went wrong, while fetching Data");
    } on SocketException {
      throw ApiException("Please check your internet connection");
    } on FormatException {
      throw ApiException("There was a problem while parsing");
    } catch (e) {
      throw ApiException("Something went wrong");
    }
  }
}
