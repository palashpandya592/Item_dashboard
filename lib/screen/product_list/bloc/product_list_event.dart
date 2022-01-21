import 'package:equatable/equatable.dart';

abstract class ProductListEvent extends Equatable{
  @override
  List<Object> get props => [];
}
class FetchProductListEvent extends ProductListEvent{}

