import 'package:flutter/material.dart';

class DropDownButtonFormFieldWidget extends StatefulWidget {
  const DropDownButtonFormFieldWidget(
      {super.key,
      required this.label,
      required this.value,
      required this.items,
      required this.padding,
      this.color,
      this.onChanged,
      this.hint,
      this.hintText});

  final String label;
  final Object? value;
  final Color? color;
  final List<DropdownMenuItem<Object>> items;
  final void Function(Object?)? onChanged;
  final String? hintText;
  final Widget? hint;
  final EdgeInsetsGeometry padding;

  @override
  State<DropDownButtonFormFieldWidget> createState() =>
      _DropDownButtonFormFieldWidgetState();
}

class _DropDownButtonFormFieldWidgetState
    extends State<DropDownButtonFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: Column(children: [
        Container(
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(20),
          ),
          child: DropdownButtonFormField(
            hint: widget.hint,
            dropdownColor: Colors.grey,
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
                border: InputBorder.none,
                hoverColor: Colors.white,
                focusColor: Colors.white,
                fillColor: Colors.grey,
                hintStyle:
                    const TextStyle(color: Color.fromARGB(255, 16, 14, 14)),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelText: widget.label,
                labelStyle:
                    const TextStyle(color: Color.fromARGB(255, 13, 13, 13)),
                errorStyle: const TextStyle(
                  color: Colors.red,
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.black))),
            value: widget.value,
            isExpanded: true,
            onChanged: widget.onChanged,
            validator: (value) {
              if (value.toString().isEmpty) {
                return '${widget.label} is required';
              }
              return null;
            },
            items: widget.items,
          ),
        ),
      ]),
    );
  }
}