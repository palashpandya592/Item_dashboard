import 'package:desktop_app_demo/route/route_name.dart';
import 'package:desktop_app_demo/screen/product_detail/bloc/product_detail_event.dart';
import 'package:desktop_app_demo/screen/product_detail/bloc/product_detail_state.dart';
import 'package:desktop_app_demo/utilites/label_field.dart';
import 'package:desktop_app_demo/utilites/material_button.dart';
import 'package:desktop_app_demo/utilites/style_extension.dart';
import 'package:desktop_app_demo/utilites/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/product_detail_bloc.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  ProductDetailBloc productBloc = ProductDetailBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => productBloc,
      child: BlocListener<ProductDetailBloc, ProductDetailState>(
        listener: (context, state) {
          if (state.productDeleteStatus == true) {
            Navigator.pop(context);
            Navigator.pop(context);
            Navigator.pushNamed(context, RoutesName.PRODUCT_LIST_PAGE);
          }
        },
        child: BlocBuilder<ProductDetailBloc, ProductDetailState>(
          builder: (context, state) {
            if (state.isInitialState == true) {
              productBloc.add(FetchProductEvent(widget.id));
            }

            return Scaffold(
              appBar: AppBar(
                title: const Text('Product Detail Screen'),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 40),
                    child: InkWell(
                      onTap: () async {
                        var product = state.productDetail!.product;
                        Navigator.pushNamed(
                            context, RoutesName.ADD_PRODUCT_PAGE,
                            arguments: product);
                      },
                      child: LabelFieldWidget(
                        textLabel: 'Edit Product',
                        textStyle: textStyle(Colors.white, FontWeight.w600, 16),
                        icon: Icons.edit,
                        iconColor: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 40),
                    child: InkWell(
                      onTap: () {
                        AlertDialog alert = AlertDialog(
                          content: TextWidget(
                              text: 'Are your sure delete this product',
                              style:
                                  textStyle(Colors.black, FontWeight.w500, 16)),
                          actions: [
                            MaterialButtonWidget(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: TextWidget(
                                text: 'NO',
                                style: textStyle(
                                    Colors.black, FontWeight.w500, 14),
                              ),
                            ),
                            MaterialButtonWidget(
                              onTap: () {
                                Navigator.pop(context);
                                context
                                    .read<ProductDetailBloc>()
                                    .add(ProductDeleteEvent(widget.id));
                              },
                              child: TextWidget(
                                text: 'Yes',
                                style: textStyle(
                                    Colors.black, FontWeight.w500, 14),
                              ),
                            ),
                          ],
                        );
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return alert;
                          },
                        );
                      },
                      child: LabelFieldWidget(
                        textLabel: 'Delete Product',
                        textStyle: textStyle(Colors.white, FontWeight.w600, 16),
                        icon: Icons.delete,
                        iconColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              body: state.productDetail != null
                  ? Container(
                      padding: const EdgeInsets.all(16),
                      child: Center(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Card(
                                margin: const EdgeInsets.all(8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: state.productDetail!.product!.image !=
                                        null
                                    ? FadeInImage.assetNetwork(
                                        height: 600,
                                        width: 150,
                                        placeholder: 'assets/images/donut.png',
                                        image: state
                                            .productDetail!.product!.image!)
                                    : SizedBox(
                                        height: 1000,
                                        width: 150,
                                        child: Image.asset(
                                          'assets/images/samsung.jpeg',
                                        ),
                                      ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 150.0,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 16),
                                    child: TextWidget(
                                      text: state.productDetail!.product!.name!,
                                      style: textStyle(const Color(0xff262626),
                                          FontWeight.w600, 24),
                                      align: TextAlign.start,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 16),
                                    child: TextWidget(
                                      text: state
                                          .productDetail!.product!.description!,
                                      style: textStyle(const Color(0xff777777),
                                          FontWeight.w600, 14),
                                      align: TextAlign.start,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 16),
                                    child: TextWidget(
                                      text:
                                          '\u{20B9}${state.productDetail!.product!.mrp!}',
                                      style: textStyle(const Color(0xff777777),
                                          FontWeight.w600, 14),
                                      align: TextAlign.start,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 16),
                                    child: TextWidget(
                                      text:
                                          '\u{20B9} ${state.productDetail!.product!.selling}',
                                      style: textStyle(const Color(0xff262626),
                                          FontWeight.w600, 14),
                                      align: TextAlign.right,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 50.0,
                                  ),
                                  Row(
                                    children: [
                                      MaterialButtonWidget(
                                        width: 200,
                                        onTap: () {},
                                        child: TextWidget(
                                          text: 'ADD TO CART',
                                          style: textStyle(Colors.black,
                                              FontWeight.w600, 14),
                                        ),
                                      ),
                                      MaterialButtonWidget(
                                        width: 200,
                                        onTap: () {},
                                        child: TextWidget(
                                          text: 'BUY NOW',
                                          style: textStyle(Colors.black,
                                              FontWeight.w600, 14),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ))
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
