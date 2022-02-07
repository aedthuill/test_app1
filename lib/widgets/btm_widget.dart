import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_case/pages/basket_screen.dart';
import 'package:test_case/pages/category_list_page.dart';
import 'package:test_case/pages/favs_screen.dart';
import 'package:test_case/pages/home_screen.dart';
import 'package:test_case/pages/profile_screen.dart';

//нижняя навигация

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  child: Image.asset('assets/home.png'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()),
                    );
                  },
                ),
                const Text('Главная')
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  child: Image.asset('assets/catalog1.png'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CategoryList()),
                    );
                  },
                ),
                const Text('Категории')
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  child: Image.asset('assets/icon.png'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FavsScreen()),
                    );
                  },
                ),
                const Text('Избранное')
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  child: Image.asset('assets/basket.png'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BasketScreen()),
                    );
                  },
                ),
                const Text('Корзина')
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  child: Image.asset('assets/profile.png'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfileScreen()),
                    );
                  },
                ),
                const Text('Профиль')
              ],
            )
          ]),
    );
  }
}
