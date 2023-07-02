// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:netclan_explore/theme/app_theme.dart';
import 'package:netclan_explore/util/constants.dart';

class CustomText extends StatefulWidget {
  String title;
  String fontfamily;
  double fontSize;
  Color color;
  FontWeight fontWight;
  double height;
  TextAlign textAlign;
  double wordSpacing;
  double leftPadding;
  double rightPadding;
  double topPadding;
  double bottomPadding;

  CustomText(
      {super.key, this.color = AppTheme.colorWhite,
      this.fontSize = Constant.midiumn,
      this.fontWight = AppTheme.fontWeight,
      this.fontfamily = AppTheme.appFontName,
      required this.title,
      this.height = 1.0,
      this.wordSpacing = 0,
      this.bottomPadding = 0,
      this.leftPadding = 0,
      this.rightPadding = 0,
      this.topPadding = 0,
      this.textAlign = TextAlign.justify});

  @override
  State<CustomText> createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: widget.leftPadding,
          right: widget.rightPadding,
          bottom: widget.bottomPadding,
          top: widget.topPadding),
      child: Text(
        widget.title,
        textAlign: widget.textAlign,
        style: TextStyle(
            color: widget.color,
            fontFamily: widget.fontfamily,
            fontWeight: widget.fontWight,
            fontSize: widget.fontSize,
            height: widget.height,
            letterSpacing: widget.wordSpacing),
      ),
    );
  }
}
