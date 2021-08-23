import 'package:flutter/material.dart';

class CountSaveButton extends StatelessWidget {
  final double opacity;
  const CountSaveButton({Key key, this.opacity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      height: this.opacity == 1.0 ? 50 : 0,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5.0),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          child: Center(
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'Save Count',
                style: TextStyle(
                  color: Colors.teal[900],
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
