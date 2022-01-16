import 'package:desktop_app_demo/Util/SharedPrefenceUtil.dart';
import 'package:desktop_app_demo/route/RouteName.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bloc/ProductBloc.dart';
import 'bloc/ProductEvent.dart';
import 'bloc/ProductState.dart';

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
                      children:
                          List.generate(state.itemList!.length, (index) {
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
                                  child: Image.network(
                                    '${state.itemList![index].image ?? AspectRatio(
                                          aspectRatio: 0.5,
                                          child: Container(
                                            color: const Color(0xff27282C),
                                          ),
                                        )}',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Center(
                                  child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Text(
                                    'Name',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 18),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "${state.itemList![index].name}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 16),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              )),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Center(
                                  child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Text(
                                    'Description',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 18),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "${state.itemList![index].description}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 16),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              )),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Center(
                                  child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Text(
                                    'MRP',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 18),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "${state.itemList![index].mrp}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 16),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              )),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Center(
                                  child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Text(
                                    'Selling Price',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 18),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "${state.itemList![index].selling}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 16),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
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
