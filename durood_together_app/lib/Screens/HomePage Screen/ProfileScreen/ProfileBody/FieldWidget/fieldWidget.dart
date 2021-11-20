import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FieldWidget extends StatelessWidget {
  final String data;
  final Icon icon;
  const FieldWidget({Key key, this.data, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 5.0),
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white.withOpacity(0.4),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none,
          ),
          labelText: this.data.toString(),
          labelStyle: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          prefixIcon: this.icon,
          enabled: false,
        ),
      ),
    );
  }
}
