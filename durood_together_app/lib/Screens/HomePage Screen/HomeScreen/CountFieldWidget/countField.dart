import 'package:durood_together_app/Core/Providers/DuroodCountProvider/durood-count-provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class CountField extends StatefulWidget {
  final double opacity;
  const CountField({Key key, this.opacity}) : super(key: key);

  @override
  State<CountField> createState() => _CountFieldState();
}

class _CountFieldState extends State<CountField> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    TextEditingController _controller = new TextEditingController(
        text: context.read<DuroodCountProvider>().duroodCount != 0
            ? context.read<DuroodCountProvider>().duroodCount.toString()
            : '');

    // initState() {
    //   super.initState();
    //   _controller = new TextEditingController();
    // }

    // print(textController.text.trim());

    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      // width: (screenSize.width / 5) * 4.5,
      width: 350,
      height: this.widget.opacity == 1.0 ? 100 : 0,
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
        child: Container(
          child: TextFormField(
            controller: _controller,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
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
