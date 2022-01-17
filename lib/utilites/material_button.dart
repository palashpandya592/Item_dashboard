import 'package:flutter/material.dart';

class MaterialButtonWidget extends StatefulWidget {
  const MaterialButtonWidget(
      {Key? key, required this.onTap, required this.child})
      : super(key: key);
  final VoidCallback onTap;
  final Widget child;

  @override
  _MaterialButtonWidgetState createState() => _MaterialButtonWidgetState();
}

class _MaterialButtonWidgetState extends State<MaterialButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 48,
      width: 450,
      child: MaterialButton(
        onPressed: widget.onTap,
        child: widget.child,
        textColor: Colors.white,
        color: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
