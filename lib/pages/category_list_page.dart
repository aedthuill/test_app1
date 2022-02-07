import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:test_case/models/categories.dart';
import 'package:test_case/pages/product_list_page.dart';
import 'package:test_case/widgets/btm_widget.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    Category? _category = Provider.of<Category?>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text(
            "Категории",
            style: TextStyle(color: Colors.black45),
          )),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.grey,
            ),
          ),
        ),
        body: (_category == null)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.separated(
                itemCount: _category.items!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      _category.items![index].title!,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.grey,
                      size: 10,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProductList()),
                      );
                    },
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    thickness: 1,
                  );
                },
              ),
        bottomNavigationBar: BottomNavBar());
  }
}
