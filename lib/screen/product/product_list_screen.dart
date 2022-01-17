import 'package:cached_network_image/cached_network_image.dart';
import 'package:desktop_app_demo/Util/shared_prefence_util.dart';
import 'package:desktop_app_demo/route/route_name.dart';
import 'package:desktop_app_demo/utilites/product_list_widget.dart';
import 'package:desktop_app_demo/utilites/style_extension.dart';
import 'package:desktop_app_demo/utilites/text_widget.dart';
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
                      crossAxisCount: 4,
                      crossAxisSpacing: 4,
                      childAspectRatio: 0.66,
                      children: List.generate(state.itemList!.length, (index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: AspectRatio(
                                  aspectRatio: 0.8,
                                  child: /*CachedNetworkImage(
                                    imageUrl: '${state.itemList![index].image}',
                                    placeholder: (context, url) =>
                                        const CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),*/
                                      state.itemList?[index].image != null
                                          ? FadeInImage.assetNetwork(
                                              placeholder:
                                                  'assets/image/donut.png',
                                              image:
                                                  state.itemList![index].image!)
                                          : Image.asset('assets/image/camera'),
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 16),
                                child: TextWidget(
                                  text: state.itemList![index].name!,
                                  style: textStyle(const Color(0xff262626),
                                      FontWeight.w600, 16),
                                  align: TextAlign.start,
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 16),
                                child: TextWidget(
                                  text: state.itemList![index].description!,
                                  style: textStyle(const Color(0xff777777),
                                      FontWeight.w600, 14),
                                  align: TextAlign.start,
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 16),
                                child: TextWidget(
                                  text:
                                      '\u{20B9} ${state.itemList![index].mrp}',
                                  style: textStyle(const Color(0xff777777),
                                      FontWeight.w600, 16),
                                  align: TextAlign.start,
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                alignment: Alignment.centerRight,
                                padding: const EdgeInsets.only(right: 16),
                                child: TextWidget(
                                  text:
                                      '\u{20B9} ${state.itemList![index].selling}',
                                  style: textStyle(const Color(0xff262626),
                                      FontWeight.w600, 14),
                                  align: TextAlign.right,
                                ),
                              ),
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
