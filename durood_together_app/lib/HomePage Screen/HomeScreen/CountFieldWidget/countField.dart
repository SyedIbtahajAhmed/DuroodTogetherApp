import 'package:flutter/material.dart';

class CountField extends StatelessWidget {
  final double opacity;
  const CountField({Key key, this.opacity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      width: (screenSize.width / 5) * 4.5,
      height: this.opacity == 1.0 ? 100 : 0,
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
        child: Container(
          child: TextFormField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              hintText: 'Enter Your Durood Shareef Count',
              hintStyle: TextStyle(
                fontSize: 20,
              ),
              // prefixIcon: Icon(Icons.email),
              enabled: true,
            ),
            keyboardType: TextInputType.number,
            showCursor: false,
          ),
        ),
      ),
    );
  }
}
