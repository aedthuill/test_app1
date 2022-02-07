import 'package:flutter/material.dart';
import 'package:test_case/widgets/btm_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Экран главная находится в разработке'),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
