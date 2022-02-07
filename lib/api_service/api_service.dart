import 'dart:convert';
import 'dart:io';

import 'package:test_case/models/categories.dart';
import 'package:http/http.dart' as http;
import 'package:test_case/models/product.dart';

/*здесь находятся запросы к АПИ
я использую пакет  http для обработки запроса */
class ApiService {
  //Запрос к списку категорий
  Future<Category?> fetchCategories() async {
    var response = await http
        .get(Uri.parse('https://vue-study.skillbox.cc/api/productCategories'));
    var jsonResponse = json.decode(response.body);
    if (response.statusCode == 200) {
      return Category.fromJson(jsonResponse);
    } else if (response.statusCode == 400) {
      throw HttpStatus.badRequest;
    } else if (response.statusCode == 502) {
      throw HttpStatus.badGateway;
    } else if (response.statusCode == 404) {
      throw HttpStatus.notFound;
    } else {
      return null;
    }
  }

  //запрос ко всему списку продуктов
  //если убрать этот запрос, то тогда список продуктов не будет подгружаться по скроллу
  Future<Product?> fetchProduct() async {
    var response =
        await http.get(Uri.parse('https://vue-study.skillbox.cc/api/products'));
    var jsonResponse = json.decode(response.body);
    if (response.statusCode == 200) {
      return Product.fromJson(jsonResponse);
    } else if (response.statusCode == 400) {
      throw HttpStatus.badRequest;
    } else if (response.statusCode == 502) {
      throw HttpStatus.badGateway;
    } else if (response.statusCode == 404) {
      throw HttpStatus.notFound;
    } else {
      return null;
    }
  }
}
