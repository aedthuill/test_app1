import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:test_case/provider/add_product_to_cart.dart';
import 'package:test_case/provider/provider_list_product.dart';
import 'package:test_case/widgets/btm_widget.dart';
import 'package:test_case/widgets/filter_bar_widget.dart';

import 'category_list_page.dart';

//список продуктов

class ProductList extends StatefulWidget {
  const ProductList({
    Key? key,
  }) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  /*здесь во второй раз вызываю этот контроллер из пакета,
  потому что если это делать через провайдер,
  то постоянно будет сваливаться в ошибку и нужно повторно перезагружать*/

  final RefreshController _refreshController =
      RefreshController(initialRefresh: true);

  @override
  Widget build(BuildContext context) {
    var providerGridPagination = Provider.of<ProviderGridProduct>(context);
    var cart = Provider.of<AddToCart>(context);
    return Scaffold(
        appBar: AppBar(
         title: Row(
           mainAxisSize: MainAxisSize.max,
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: [
             Text(
               "Категории товаров",
               style: TextStyle(color: Colors.black45),
             ),
             IconButton(
               onPressed: () {
               },
               icon: const Icon(
                 Icons.search,
                 color: Colors.black45,
               ),
             ),
           ],
         ),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CategoryList()),
              );
            },
           icon: const Icon(
              Icons.arrow_back,
              color: Colors.black45,
            ),
          ),
        ),
        body: Column(children: [
          const FiltersWidget(),
          Expanded(
            child: SmartRefresher(
              controller: _refreshController,
              enablePullUp: true,
              onRefresh: () async {
                final result = await providerGridPagination.getProductData(
                    isRefresh: true);
                if (result) {
                  _refreshController.refreshCompleted();
                } else {
                  _refreshController.refreshFailed();
                }
              },
              onLoading: () async {
                final result = await providerGridPagination.getProductData();
                if (result) {
                  providerGridPagination.refreshController.loadComplete();
                } else {
                  providerGridPagination.refreshController.loadFailed();
                }
              },
              child: GridView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                          providerGridPagination
                              .itemgrid[index].image!.file!.url!,
                          width: 100,
                          height: 100,
                        ),
                      ),
                      Container(
                        width: 164,
                        height: 36,
                        color: Color.fromRGBO(138, 136, 132, 0.08),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(providerGridPagination.itemgrid[index].price
                                .toString()),
                            Consumer<AddToCart>(builder: (ctx, value, child) {
                              return IconButton(
                                  onPressed: () {
                                    cart.onCartPress(
                                        index,
                                        providerGridPagination
                                            .itemgrid[index].id);
                                  },
                                  icon: cart.getIcon(index));
                            }),
                          ],
                        ),
                      ),
                      Flexible(
                          child: Padding(
                        padding: const EdgeInsets.only(left: 10, top: 2),
                        child: Text(
                            providerGridPagination.itemgrid[index].title!,
                            maxLines: 10,
                            softWrap: true,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.visible),
                      ))
                    ],
                  );
                },
                itemCount: providerGridPagination.itemgrid.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
              ),
            ),
          ),
        ]),
        bottomNavigationBar: const BottomNavBar());
  }
}
