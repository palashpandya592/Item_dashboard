import 'package:desktop_app_demo/api/product_api.dart';
import 'package:desktop_app_demo/screen/product/bloc/product_event.dart';
import 'package:desktop_app_demo/util/shared_prefence_util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitialState()) {
    on<ShowProductListEvent>(_showListMovie);
  }

  void _showListMovie(
      ShowProductListEvent event, Emitter<ProductState> emit) async {
    final sharedPreferenceUtil = SharedPreferenceUtil.getInstance();
    String? token =
        await sharedPreferenceUtil.getString(SharedPreferenceUtil.TOKEN);
    var list = await ProductListAPI.productListAPI(token);
    emit(ShowIProductListSuccessState(itemList: list));
  }
}
