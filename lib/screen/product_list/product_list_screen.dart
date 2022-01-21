import 'package:desktop_app_demo/Util/shared_prefence_util.dart';
import 'package:desktop_app_demo/model/product.dart';
import 'package:desktop_app_demo/route/route_name.dart';
import 'package:desktop_app_demo/screen/product_list/bloc/product_list_event.dart';
import 'package:desktop_app_demo/utilites/label_field.dart';
import 'package:desktop_app_demo/utilites/style_extension.dart';
import 'package:desktop_app_demo/utilites/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bloc/product_list_bloc.dart';
import 'bloc/product_list_state.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  ProductListBloc itemBloc = ProductListBloc();
  var scrollController = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    itemBloc.add(FetchProductListEvent());
    scrollListener();
  }

  void scrollListener() {
    scrollController.addListener(() {
      if ((scrollController.position.pixels ==
          scrollController.position.maxScrollExtent)) {
        itemBloc.add(FetchProductListEvent());
      } else {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => itemBloc,
      child: BlocListener<ProductListBloc, ProductListState>(
        listener: (context, state) {},
        child: BlocBuilder<ProductListBloc, ProductListState>(
          builder: (context, state) {
            if (state.isInitialState) {
              itemBloc.add(FetchProductListEvent());
            }
            return Scaffold(
              appBar: AppBar(
                title: const Text('Product List Screen'),
                actions: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 40),
                    child: InkWell(
                      onTap: () async {
                        Product product = Product();
                        Navigator.pushNamed(
                            context, RoutesName.ADD_PRODUCT_PAGE,
                            arguments: product);
                      },
                      child: LabelFieldWidget(
                        textLabel: 'Add Product',
                        textStyle: textStyle(Colors.white, FontWeight.w600, 16),
                        icon: Icons.add,
                        iconColor: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: InkWell(
                      onTap: () async {
                        SharedPreferences sharedPreferences =
                            await SharedPreferences.getInstance();
                        sharedPreferences.remove(SharedPreferenceUtil.TOKEN);
                        Navigator.pop(context);
                        Navigator.pushNamed(context, RoutesName.LOGIN_PAGE);
                      },
                      child: LabelFieldWidget(
                        textLabel: 'Log Out',
                        textStyle: textStyle(Colors.white, FontWeight.w600, 16),
                        icon: Icons.logout,
                        iconColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              body: Column(
                children: [
                  Expanded(
                    child: state.productList != null
                        ? GridView.count(
                            crossAxisCount: 4,
                            crossAxisSpacing: 4,
                            childAspectRatio: 0.66,
                            controller: scrollController,
                            children: List.generate(state.productList!.length,
                                (index) {
                              return Container(
                                padding: const EdgeInsets.all(8),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, RoutesName.PRODUCT_PAGE,
                                        arguments:
                                            state.productList![index].id);
                                  },
                                  child: Card(
                                    margin: const EdgeInsets.all(8),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: AspectRatio(
                                            aspectRatio: 8,
                                            child: state.productList?[index]
                                                        .image !=
                                                    null
                                                ? FadeInImage.assetNetwork(
                                                    placeholder:
                                                        'assets/images/donut.png',
                                                    image: state
                                                        .productList![index]
                                                        .image!)
                                                : Image.asset(
                                                    'assets/images/samsung.jpeg'),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        Container(
                                          padding:
                                              const EdgeInsets.only(left: 16),
                                          child: TextWidget(
                                            text:
                                                state.productList![index].name!,
                                            style: textStyle(
                                                const Color(0xff262626),
                                                FontWeight.w600,
                                                16),
                                            align: TextAlign.start,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        Container(
                                          padding:
                                              const EdgeInsets.only(left: 16),
                                          child: TextWidget(
                                            text: state.productList![index]
                                                .description!,
                                            style: textStyle(
                                                const Color(0xff777777),
                                                FontWeight.w600,
                                                14),
                                            align: TextAlign.start,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        Container(
                                          alignment: Alignment.centerRight,
                                          padding:
                                              const EdgeInsets.only(right: 16),
                                          child: TextWidget(
                                            text:
                                                '\u{20B9} ${state.productList![index].selling}',
                                            style: textStyle(
                                                const Color(0xff262626),
                                                FontWeight.w600,
                                                14),
                                            align: TextAlign.right,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5.0,
                                        ),
                                        if (isLoading == true)
                                          const CircularProgressIndicator(),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          ),
                  ),

                    if (state.isInitialState== true) const Text('')
                 else
                   if(state.isLoading ==true ) const CircularProgressIndicator()
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
