import 'package:durood_together_app/Core/Providers/DuroodCountProvider/durood-count-provider.dart';
import 'package:durood_together_app/Shared/Const/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class CustomTasbeeh extends StatefulWidget {
  final String insideText;
  const CustomTasbeeh({
    Key key,
    this.insideText,
  }) : super(key: key);

  @override
  State<CustomTasbeeh> createState() => _CustomTasbeehState();
}

class _CustomTasbeehState extends State<CustomTasbeeh> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final size = screenSize.width * 0.8;
    return TweenAnimationBuilder(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(seconds: 4),
      builder: (context, value, child) {
        int percentage =
            (context.watch<DuroodCountProvider>().duroodCount * value).ceil();
        return Container(
          width: size,
          height: size,
          child: Stack(
            children: [
              ShaderMask(
                shaderCallback: (rect) {
                  return SweepGradient(
                      startAngle: 0.0,
                      endAngle: 1.0,
                      stops: [value, value],
                      // 0.0 , 0.5 , 0.5 , 1.0
                      center: Alignment.center,
                      colors: [
                        Constant.app_primary_contrast_color,
                        Constant.app_primary_contrast_color_light.withAlpha(55)
                      ]).createShader(rect);
                },
                child: Container(
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                    color: Constant.app_primary_contrast_color,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: Image.asset("images/circular.jpg").image),
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: size - 60,
                  height: size - 60,
                  decoration: BoxDecoration(
                    color: Constant.app_primary_color,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                      child: Text(
                    "$percentage",
                    style: TextStyle(fontSize: 40),
                  )),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
