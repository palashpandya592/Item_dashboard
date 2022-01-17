import 'package:cached_network_image/cached_network_image.dart';
import 'package:desktop_app_demo/Util/shared_prefence_util.dart';
import 'package:desktop_app_demo/route/route_name.dart';
import 'package:desktop_app_demo/utilites/product_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bloc/product_bloc.dart';
import 'bloc/product_event.dart';
import 'bloc/product_state.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  ProductBloc itemBloc = ProductBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => itemBloc,
      child: BlocListener<ProductBloc, ProductState>(
        listener: (context, state) {},
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductInitialState) {
              itemBloc.add(ShowProductListEvent());
            }
            return Scaffold(
              appBar: AppBar(
                title: const Text("ProductList"),
                backgroundColor: Colors.black,
                actions: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: IconButton(
                      icon: const Icon(
                        Icons.logout,
                        size: 40,
                        color: Colors.white,
                        semanticLabel: 'Log Out',
                      ),
                      onPressed: () async {
                        SharedPreferences sharedPreferences =
                            await SharedPreferences.getInstance();
                        sharedPreferences.remove(SharedPreferenceUtil.TOKEN);
                        Navigator.pop(context);
                        Navigator.pushNamed(context, RoutesName.LOGIN_PAGE);
                      },
                    ),
                  ),
                ],
              ),
              body: state is ShowIProductListSuccessState
                  ? GridView.count(
                      crossAxisCount: 3,
                      crossAxisSpacing: 3,
                      childAspectRatio: 0.66,
                      children: List.generate(state.itemList!.length, (index) {
                        return Card(
                          color: const Color(0xff27282C),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: AspectRatio(
                                  aspectRatio: 0.5,
                                  child: CachedNetworkImage(
                                    imageUrl: '${state.itemList![index].image}',
                                    placeholder: (context, url) =>
                                        const CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Center(
                                child: ProductListWidget(
                                  textLabelName: 'Name',
                                  textProduct: state.itemList![index].name,
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Center(
                                  child: ProductListWidget(
                                textLabelName: 'Description',
                                textProduct: state.itemList![index].description,
                              )),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Center(
                                child: ProductListWidget(
                                    textLabelName: 'MRP',
                                    textProduct:
                                        '${state.itemList![index].mrp}'),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Center(
                                  child: ProductListWidget(
                                textLabelName: 'Selling Price',
                                textProduct:
                                    '${state.itemList![index].selling}',
                              )),
                              const SizedBox(
                                height: 5.0,
                              ),
                            ],
                          ),
                        );
                      }),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            );
          },
        ),
      ),
    );
  }
}
// FadeInImage(
// image: NetworkImage(
// '${state.itemList![index].image}'),
// placeholder: const AssetImage(
// 'assets/image/donut.png'),
// fit: BoxFit.cover,
// ),
