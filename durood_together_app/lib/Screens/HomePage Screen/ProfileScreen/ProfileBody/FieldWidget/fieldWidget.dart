import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FieldWidget extends StatelessWidget {
  final String data;
  const FieldWidget({Key key, this.data}) : super(key: key);

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
          prefixIcon: Icon(Icons.email),
          enabled: false,
        ),
      ),
    );
  }
}
