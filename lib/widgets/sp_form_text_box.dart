import 'package:flutter/material.dart';
import 'package:travel_ease/utils/sp_text_box_type.dart';

class SpFormTextBox extends StatefulWidget {
  final TextEditingController controller;
  final SpTextBoxType type;
  final String? Function(String?) validator;

  const SpFormTextBox({
    super.key,
    required this.controller,
    required this.type,
    required this.validator,
  });

  @override
  State<SpFormTextBox> createState() => _SpFormTextBoxState();
}

class _SpFormTextBoxState extends State<SpFormTextBox> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.type.obscure,
      keyboardType: widget.type.keyboardType,
      validator: widget.validator,

      decoration: InputDecoration(
        suffixIcon: widget.type.placeholderIcon,
        contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        labelStyle: TextStyle(color: Colors.grey.shade400),
        hint: _hintWidget(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 80, 146, 161),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(18),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF005B9F), width: 2.0),
          borderRadius: BorderRadius.circular(18),
        ),
        fillColor: Colors.grey.shade900,
      ),
    );
  }

  Widget _hintWidget() {
    if (widget.type == SpTextBoxType.password) {
      return Row(children: [Text(widget.type.placeholderText)]);
    } else {
      return Row(children: [Text(widget.type.placeholderText)]);
    }
  }
}
