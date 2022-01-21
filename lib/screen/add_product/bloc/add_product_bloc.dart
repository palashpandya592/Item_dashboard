import 'package:desktop_app_demo/api/product_api.dart';
import 'package:desktop_app_demo/model/add_product_request.dart';
import 'package:desktop_app_demo/screen/add_product/bloc/add_product_event.dart';
import 'package:desktop_app_demo/screen/add_product/bloc/add_product_state.dart';
import 'package:desktop_app_demo/util/shared_prefence_util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductBloc extends Bloc<AddProductEvent, AddProductState> {
  int? id;

  AddProductBloc() : super(const AddProductState()) {
    on<ProductUpdateEventId>(_productId);
    on<SubmitProductEvent>(_addProduct);
    on<ProductNameChangeEvent>(_addProductName);
    on<ProductDescriptionChangeEvent>(_addProductDescription);
    on<ProductMRPChangeEvent>(_addProductMRP);
    on<ProductSellChangeEvent>(_addProductSellPrice);
  }

  void _productId(ProductUpdateEventId event, Emitter<AddProductState> emit) {
    id = event.id;
  }

  void _addProduct(
      SubmitProductEvent event, Emitter<AddProductState> emit) async {
    if (event.name != null &&
        event.description != null &&
        event.mrp != null &&
        event.sellingPrice != null) {
      emit(state.copyWith(isSuccessAddProduct: false, isLoading: false));
      final sharedPreferenceUtil = SharedPreferenceUtil.getInstance();
      String? token =
          await sharedPreferenceUtil.getString(SharedPreferenceUtil.TOKEN);
      AddProductRequest product = AddProductRequest();
      product.name = event.name;
      product.description = event.description;
      product.mrp = event.mrp;
      product.selling = event.sellingPrice;

      if (id != null) {
        // update Product
        if (event.file != null) {
          // update product with image
          var responseUpdate = ProductAPI.updateProductAPIWithImage(
              token, product, id!, event.file!);
          if (responseUpdate != null) {
            emit(state.copyWith(isSuccessAddProduct: true, isLoading: true));
          } else {
            emit(state.copyWith(isSuccessAddProduct: false, isLoading: false));
          }
        } else {
          // update product without image
          var responseUpdate =
              ProductAPI.updateProductAPWithoutImage(token, product, id!);
          if (responseUpdate != null) {
            emit(state.copyWith(isSuccessAddProduct: true, isLoading: true));
          } else {
            emit(state.copyWith(isSuccessAddProduct: false, isLoading: false));
          }
        }
      } else {
        //  Add Product
        if (event.file != null) {
          // add Product with image
          var response =
              ProductAPI.addProductAPIWithImage(token, product, event.file!);
          if (response != null) {
            emit(state.copyWith(isSuccessAddProduct: true, isLoading: true));
          } else {
            emit(state.copyWith(isSuccessAddProduct: false, isLoading: false));
          }
        } else {
          // add Product without image
          var response = ProductAPI.addProductAPIWithoutImage(token, product);
          if (response != null) {
            emit(state.copyWith(isSuccessAddProduct: true, isLoading: true));
          } else {
            emit(state.copyWith(isSuccessAddProduct: false, isLoading: false));
          }
        }
      }
    } else {
      if (event.name!.isEmpty) {
        emit(state.copyWith(isName: false));
      }
      if (event.description!.isEmpty) {
        emit(state.copyWith(validDescription: false));
      }
      if (event.mrp == null) {
        emit(state.copyWith(validMRP: false));
      }
      if (event.sellingPrice == null) {
        emit(state.copyWith(validSellPrice: false));
      }
    }
  }

  void _addProductName(
      ProductNameChangeEvent event, Emitter<AddProductState> emit) async {
    if (event.name != null) {
      emit(state.copyWith(isName: true));
    } else {
      emit(state.copyWith(isName: false));
    }
  }

  void _addProductDescription(ProductDescriptionChangeEvent event,
      Emitter<AddProductState> emit) async {
    if (event.description != null) {
      emit(state.copyWith(validDescription: true));
    } else {
      emit(state.copyWith(validDescription: false));
    }
  }

  void _addProductMRP(
      ProductMRPChangeEvent event, Emitter<AddProductState> emit) async {
    if (event.mrp != null) {
      emit(state.copyWith(validMRP: true));
    } else {
      emit(state.copyWith(validMRP: false));
    }
  }

  void _addProductSellPrice(
      ProductSellChangeEvent event, Emitter<AddProductState> emit) async {
    if (event.sellPrice != null) {
      emit(state.copyWith(validSellPrice: true));
    } else {
      emit(state.copyWith(validSellPrice: false));
    }
  }
}
