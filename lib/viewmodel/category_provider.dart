import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pie_solution/api/status.dart';
import 'package:pie_solution/model/category_model.dart';
import 'package:pie_solution/repository/category_repo.dart';

final categoryProvider = ChangeNotifierProvider((ref) => CategoryNotifier());

class CategoryNotifier extends ChangeNotifier {
  String _errMsg;
  FetchStatus _status = FetchStatus.loading; // Default Loading Status
  CategoryRepository _repository = CategoryRepository();
  List<Category> _category;
  fetchCategories() async {
    try {
      _status = FetchStatus.loading;
      _category = await _repository.fetch();
      print("${_category}");
      _status = FetchStatus.success;
      _errMsg = null;
    } catch (e) {
      _errMsg = e.message;
      _category = null;
      _status = FetchStatus.error;
    }
    notifyListeners();
  }

  FetchStatus get status => _status;
  List<Category> get category => _category;
  String get errMsg => _errMsg;
}
