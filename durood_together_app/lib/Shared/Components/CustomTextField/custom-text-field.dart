import 'package:durood_together_app/Shared/Const/constant.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final double opacity;
  final String labelText;
  final TextEditingController textEditingController;
  const CustomTextField({
    Key key,
    this.opacity,
    this.labelText,
    this.textEditingController,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    // final DuroodCountProvider duroodCount =
    // Provider.of<DuroodCountProvider>(context, listen: false);
    // TextEditingController _textController = TextEditingController(
    //     text: duroodCount.duroodCountField != 0
    //         ? duroodCount.duroodCountField.toString()
    //         : '');

    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      // width: (screenSize.width / 5) * 4.5,
      width: screenSize.width < 380 ? 200 : 380,
      height: this.widget.opacity == 1.0 ? 100 : 0,
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
        child: Container(
          child: TextFormField(
            controller: this.widget.textEditingController,
            onChanged: (value) {
              print(value);
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
              hintText: this.widget.labelText,
              hintStyle: TextStyle(
                fontSize: screenSize.width < 350 ? Constant.h6 : Constant.h5,
              ),
              // prefixIcon: Icon(Icons.email),
              enabled: true,
            ),
            keyboardType: TextInputType.text,
            showCursor: false,
          ),
        ),
      ),
    );
  }
}
