import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_case/api_service/api_service.dart';
import 'package:test_case/pages/category_list_page.dart';
import 'package:test_case/provider/add_product_to_cart.dart';
import 'package:test_case/provider/provider_list_product.dart';
import 'models/categories.dart';
import 'models/product.dart' as item;

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final ApiService _service = ApiService();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProviderGridProduct()),
        ChangeNotifierProvider(create: (context) => AddToCart()),
        FutureProvider<Category?>(
            create: (context) => _service.fetchCategories(),
            catchError: (context, error) {},
            initialData: null),
        FutureProvider<item.Product?>(
            create: (context) => _service.fetchProduct(),
            catchError: (context, error) {},
            initialData: null),
      ],
      child: MaterialApp(home: const CategoryList()),
    );
  }
}
