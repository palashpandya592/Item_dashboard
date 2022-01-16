import 'package:desktop_app_demo/model/ProductDetails.dart';

abstract class ProductState {
  @override
  List<Object?> get props => [];
}

class ProductInitialState extends ProductState {}

class ShowIProductListSuccessState extends ProductState {
  List<Item>? itemList = [];

  ShowIProductListSuccessState({this.itemList});

  @override
  List<Object?> get props => [itemList];
}
