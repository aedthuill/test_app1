import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_case/widgets/btm_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Экран профиль находится в разработке'),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
