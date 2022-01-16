import 'package:desktop_app_demo/api/ProductApi.dart';
import 'package:desktop_app_demo/screen/product/bloc/ProductEvent.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ProductState.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitialState()) {
    on<ShowProductListEvent>(_showListMovie);
  }

  void _showListMovie(
      ShowProductListEvent event, Emitter<ProductState> emit) async {
    var list = await ProductListAPI.productListAPI();
    emit(ShowIProductListSuccessState(itemList: list));
  }
}
