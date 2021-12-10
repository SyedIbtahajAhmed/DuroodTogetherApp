import 'package:durood_together_app/Core/Providers/DuroodCountProvider/durood-count-provider.dart';
import 'package:durood_together_app/Shared/Const/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountField extends StatefulWidget {
  final double opacity;
  const CountField({Key key, this.opacity}) : super(key: key);

  @override
  State<CountField> createState() => _CountFieldState();
}

class _CountFieldState extends State<CountField> {
  TextEditingController _textController;

  // @override
  // void initState() {
  //   final DuroodCountProvider duroodCount =
  //       Provider.of<DuroodCountProvider>(context, listen: false);
  //
  //   super.initState();
  //   _textController =
  //       TextEditingController(text: duroodCount.duroodCount.toString());
  // }

  // @override
  // void dispose() {
  //   _textController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    final DuroodCountProvider duroodCount =
        Provider.of<DuroodCountProvider>(context, listen: false);
    TextEditingController _textController = TextEditingController(
        text: duroodCount.duroodCountField != 0
            ? duroodCount.duroodCountField.toString()
            : '');

    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      // width: (screenSize.width / 5) * 4.5,
      width: screenSize.width < 350 ? 200 : 350,
      height: this.widget.opacity == 1.0 ? 100 : 0,
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
        child: Container(
          child: TextFormField(
            controller: _textController,
            onChanged: (value) {
              print(value);
              duroodCount
                  .duroodCountFromField(int.parse(value.trim().toString()));
            },
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              filled: true,
              fillColor: Constant.app_primary_color,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                    Constant.app_text_fields_border_radius),
                borderSide: BorderSide.none,
              ),
              hintText: 'Enter Your Durood Shareef Count',
              hintStyle: TextStyle(
                fontSize: screenSize.width < 350 ? Constant.h5 : Constant.h4,
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
