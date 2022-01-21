import 'package:desktop_app_demo/model/product_details.dart';
import 'package:equatable/equatable.dart';

class ProductDetailState extends Equatable {
  final ProductDetail? productDetail;

  final bool? isInitialState;
  final bool? productDeleteStatus;

  const ProductDetailState({
    this.productDetail,
    this.isInitialState = true,
    this.productDeleteStatus = true,
  });

  ProductDetailState copyWith({
    ProductDetail? productDetail,
    bool? isInitialState,
    bool? productDeleteStatus,
  }) {
    return ProductDetailState(
      productDetail: productDetail ?? this.productDetail,
      isInitialState: isInitialState ?? this.isInitialState,
      productDeleteStatus: productDeleteStatus ?? productDeleteStatus,
    );
  }

  @override
  List<Object?> get props =>
      [productDetail, isInitialState, productDeleteStatus];
}
