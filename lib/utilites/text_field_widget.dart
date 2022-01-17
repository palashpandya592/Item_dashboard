import 'package:flutter/material.dart';

typedef StringCallback = void Function(String text);

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget(
      {Key? key,
      this.controller,
      this.hintTextStyle,
      required this.placeholderText,
      this.textStyle,
      this.onChanged,
      this.cursorColors})
      : super(key: key);
  final TextEditingController? controller;
  final StringCallback? onChanged;
  final String? placeholderText;
  final TextStyle? hintTextStyle;
  final TextStyle? textStyle;
  final Color? cursorColors;

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: 450,
      child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 2,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 2,
            ),
          ),
          hintText: widget.placeholderText,
          hintStyle: widget.hintTextStyle,
        ),
        style: widget.textStyle,
        cursorColor: widget.cursorColors,
        onChanged: widget.onChanged,
      ),
    );
  }
}
