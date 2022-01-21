import 'package:equatable/equatable.dart';

class AddProductState extends Equatable {
  final bool? isSuccessAddProduct;
  final bool? isLoading;
  final bool? isName;
  final bool? validDescription;
  final bool? validMRP;
  final bool? validSellPrice;

  AddProductState copyWith({
    bool? isSuccessAddProduct,
    bool? isLoading,
    bool? isName,
    bool? validDescription,
    bool? validMRP,
    bool? validSellPrice,
  }) {
    return AddProductState(
      isSuccessAddProduct: isSuccessAddProduct ?? isSuccessAddProduct,
      isLoading: isLoading ?? isLoading,
      isName: isName ?? isName,
      validDescription: validDescription ?? validDescription,
      validMRP: validMRP ?? validMRP,
      validSellPrice: validSellPrice ?? validSellPrice,
    );
  }

  const AddProductState(
      {this.isSuccessAddProduct,
      this.isName,
      this.isLoading,
      this.validDescription,
      this.validMRP,
      this.validSellPrice});

  @override
  List<Object?> get props => [
        isSuccessAddProduct,
        isName,
        isLoading,
        validSellPrice,
        validMRP,
        validDescription
      ];
}
