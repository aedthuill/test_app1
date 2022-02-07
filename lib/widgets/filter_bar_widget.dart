import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FiltersWidget extends StatelessWidget {
  const FiltersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 40, top: 20),
          child: Row(
            children: [
              Image.asset('assets/filter.png'),
              const SizedBox(
                width: 20,
                height: 20,
              ),
              const Text('Фильтры'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 40, top: 20),
          child: Row(
            children: [
              Image.asset('assets/sorting.png'),
              const SizedBox(
                width: 20,
                height: 20,
              ),
              const Text('По популярности'),
            ],
          ),
        )
      ],
    );
  }
}
