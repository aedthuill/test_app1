import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:test_case/models/product.dart';

class AddToCart with ChangeNotifier {
  final Map<int, Item> _productCart = {};

  Map<int, Item> get itemsInCart {
    return _productCart;
  }

  void onCartPress(int index, id) {
    if (_productCart.containsKey(index)) {
      _productCart.remove(index);
      return;
    }
    _productCart.putIfAbsent(index, () => Item(id: index));
    notifyListeners();
  }

  Widget getIcon(int index) {
    if (_productCart.containsKey(index)) {
      return const FaIcon(FontAwesomeIcons.cartPlus, color: Colors.green, size: 16,);
    }
    return const FaIcon(FontAwesomeIcons.shoppingCart, size: 16, color: Colors.grey,);
  }
}
