import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_case/widgets/btm_widget.dart';

class FavsScreen extends StatelessWidget {
  const FavsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Экран избранное находится в разработке'),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
