import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class Dropdown extends StatefulWidget {
  const Dropdown(
      {super.key, required this.name, required this.options, this.width});

  final String name;
  final List<int> options;
  final double? width;

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  int? _value = null;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? 50,
      child: FormBuilderDropdown<int>(
        name: widget.name,
        decoration: InputDecoration(
          labelText: _value == null ? '선택' : null,
        ),
        onChanged: (value) {
          setState(() {
            _value = value?.toInt();
            print(_value);
          });
        },
        items: widget.options
            .map((value) => DropdownMenuItem(
                  alignment: AlignmentDirectional.center,
                  value: value,
                  child: Text(value.toString()),
                ))
            .toList(),
      ),
    );
  }
}
