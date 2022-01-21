import 'dart:io';

import 'package:desktop_app_demo/model/product.dart';
import 'package:desktop_app_demo/route/route_name.dart';
import 'package:desktop_app_demo/screen/add_product/bloc/add_product_bloc.dart';
import 'package:desktop_app_demo/screen/add_product/bloc/add_product_state.dart';
import 'package:desktop_app_demo/util/colors_constant.dart';
import 'package:desktop_app_demo/utilites/label_field.dart';
import 'package:desktop_app_demo/utilites/material_button.dart';
import 'package:desktop_app_demo/utilites/style_extension.dart';
import 'package:desktop_app_demo/utilites/text_field_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/add_product_event.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController mrp = TextEditingController();
  TextEditingController selling = TextEditingController();
  AddProductBloc addProductBloc = AddProductBloc();
  PlatformFile? file;

  @override
  void initState() {
    super.initState();
    if (widget.product.id != null) {
      addProductBloc.add(ProductUpdateEventId(widget.product.id));
      name.text = widget.product.name!;
      description.text = widget.product.description!;
      mrp.text = widget.product.mrp!.toString();
      selling.text = widget.product.selling.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => addProductBloc,
      child: BlocListener<AddProductBloc, AddProductState>(
        listener: (context, state) {
          if (state.isSuccessAddProduct == true) {
            Navigator.pop(context);
            Navigator.pushNamed(context, RoutesName.PRODUCT_LIST_PAGE);
          }
        },
        child: BlocBuilder<AddProductBloc, AddProductState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Add Product Screen'),
                backgroundColor: ColorsConstant.APP_PRIMARY_COLOR,
              ),
              body: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Color(0xFF3366FF),
                              Color(0xFF00CCFF),
                            ],
                            begin: FractionalOffset(0.0, 0.0),
                            end: FractionalOffset(1.0, 0.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 338,
                            height: 52,
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: ColorsConstant.APP_PRIMARY_COLOR,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: InkWell(
                              onTap: () async {
                                var pickedFile = await FilePicker.platform
                                    .pickFiles(type: FileType.image);
                                file = pickedFile!.files.single;

                                context
                                    .read<AddProductBloc>()
                                    .add(ProductImageEvent(file!));
                              },
                              child: LabelFieldWidget(
                                textLabel: 'Upload File ',
                                textStyle: textStyle(
                                    Colors.black54, FontWeight.w600, 16),
                                icon: Icons.drive_folder_upload,
                                iconColor: Colors.black54,
                              ),
                            ),
                          ),
                          TextFieldWidget(
                              controller: name,
                              cursorColors: Colors.black,
                              textStyle: textStyle(
                                  Colors.black54, FontWeight.w600, 18),
                              hintTextStyle:
                                  textStyle(Colors.grey, FontWeight.w600, 16),
                              placeholderText: 'Enter Product Name',
                              maxLine: 1,
                              errorText: state.isName == false
                                  ? 'required product_detail name'
                                  : null,
                              onChanged: (value) {
                                context
                                    .read<AddProductBloc>()
                                    .add(ProductNameChangeEvent(value));
                              }),
                          SizedBox(
                            height: 80,
                            child: TextFieldWidget(
                              controller: description,
                              cursorColors: Colors.black,
                              textStyle: textStyle(
                                  Colors.black54, FontWeight.w600, 18),
                              hintTextStyle:
                                  textStyle(Colors.grey, FontWeight.w600, 16),
                              placeholderText: 'Enter Description',
                              errorText: state.validDescription == false
                                  ? 'required product_detail description '
                                  : null,
                              maxLine: 2,
                              onChanged: (value) {
                                context
                                    .read<AddProductBloc>()
                                    .add(ProductDescriptionChangeEvent(value));
                              },
                            ),
                          ),
                          TextFieldWidget(
                            controller: mrp,
                            cursorColors: Colors.black,
                            textStyle:
                                textStyle(Colors.black54, FontWeight.w600, 18),
                            hintTextStyle:
                                textStyle(Colors.grey, FontWeight.w600, 16),
                            placeholderText: 'Enter MRP ',
                            textInputType: TextInputType.number,
                            errorText: state.validMRP == false
                                ? 'required product_detail mrp '
                                : null,
                            maxLine: 1,
                            onChanged: (value) {
                              context
                                  .read<AddProductBloc>()
                                  .add(ProductMRPChangeEvent(int.parse(value)));
                            },
                          ),
                          TextFieldWidget(
                            controller: selling,
                            cursorColors: Colors.black,
                            textStyle:
                                textStyle(Colors.black54, FontWeight.w600, 18),
                            hintTextStyle:
                                textStyle(Colors.grey, FontWeight.w600, 16),
                            placeholderText: 'Enter Sell Price',
                            textInputType: TextInputType.number,
                            maxLine: 1,
                            errorText: state.validSellPrice == false
                                ? 'required product_detail sell '
                                : null,
                            onChanged: (value) {
                              context.read<AddProductBloc>().add(
                                  ProductSellChangeEvent(int.parse(value)));
                            },
                          ),
                          MaterialButtonWidget(
                            width: 350,
                            onTap: () {
                              context.read<AddProductBloc>().add(
                                    SubmitProductEvent(
                                      name: name.text,
                                      description: description.text,
                                      mrp: int.parse(mrp.text),
                                      sellingPrice: int.parse(selling.text),
                                      file: file,
                                    ),
                                  );
                            },
                            child: state.isLoading == true
                                ? const SizedBox(
                                    width: 26,
                                    height: 26,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors.black),
                                    ),
                                  )
                                : Text(
                                    'Add Product',
                                    style: textStyle(
                                        Colors.white, FontWeight.w600, 18),
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
