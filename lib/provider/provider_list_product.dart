import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:http/http.dart' as http;
import 'package:test_case/models/product.dart';

/*провайдер для пагинации и подгрузки товаров здесь использую пакет pull_to_refresh для упрощения задачи.
Можно делать и через ScrollController и addListener, а также через написание функции,которая по дефолту встроена во флаттер*/

class ProviderGridProduct with ChangeNotifier {
  //этот контроллер из пакета
  final RefreshController _refreshController =
      RefreshController(initialRefresh: true);

  get refreshController => _refreshController;

  //текущая страница
  int _currentPage = 1;

  int get currentPage => _currentPage;

  //берем распарсенный список Item из модели Product
  List<Item> _itemGrid = [];

  List<Item> get itemgrid => _itemGrid;

  //всего страниц
  int? _totalPages;

  int? get totalPage => _totalPages;

  //каждый раз при пагинации будет подгружать по 6 товаров на страничку. Всего товаров - 21
  Future<bool> getProductData({bool isRefresh = false}) async {
    if (isRefresh) {
      _currentPage = 1;
    } else {
      if (currentPage >= _totalPages!) {
        _refreshController.loadNoData();
        return false;
      }
    }

    final Uri uri = Uri.parse(
        "https://vue-study.skillbox.cc/api/products?page=$currentPage&limit=6");

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final result = productFromJson(response.body);

      if (isRefresh) {
        _itemGrid = result.items!;
      } else {
        _itemGrid.addAll(result.items!);
      }

      _currentPage++;

      _totalPages = result.pagination!.total;
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }
}
