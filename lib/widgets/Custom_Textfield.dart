import 'package:flutter/material.dart';
import 'package:netclan_explore/theme/app_theme.dart';
import 'package:netclan_explore/util/_string.dart';
import 'package:netclan_explore/util/constants.dart';

// ignore: must_be_immutable
class CustomTextFeild extends StatefulWidget {
  CustomTextFeild(
      {super.key,
      this.hintText = Strings.emptyString,
      this.isObscureText = Constant.isFalse,
      this.leftPadding = Constant.customPadding,
      this.rightPadding = Constant.customPadding,
      this.topPadding = Constant.customPadding,
      required this.controller,
      this.fontSize = Constant.customTextFeildFontSize});

  String hintText;
  bool isObscureText;
  double leftPadding;
  double rightPadding;
  double topPadding;
  double fontSize;
  TextEditingController controller;

  @override
  State<CustomTextFeild> createState() => _CustomTextFeildState();
}

class _CustomTextFeildState extends State<CustomTextFeild> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (value) => value!.isNotEmpty ? null : Strings.invalidInput,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: widget.isObscureText,
      maxLines: Constant.INT_TWO,
      maxLength: Constant.maxLength250,
      style: TextStyle(
        color: AppTheme.primaryColor,
        fontFamily: Strings.emptyString,
        fontSize: widget.fontSize,
      ),
      decoration: InputDecoration(
          counterStyle: TextStyle(
              fontWeight: FontWeight.bold, color: AppTheme.primaryColor),
          hintText: widget.hintText,
          hintStyle: const TextStyle(
              fontFamily: Strings.fontfamily,
              fontSize: Constant.customfieldHintSize,
              fontWeight: FontWeight.bold,
              color: AppTheme.textFieldHintColor),
          isDense: true,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: AppTheme.primaryColor
                      .withOpacity(Constant.customTextFeildColorOpacity)),
              borderRadius:
                  BorderRadius.circular(Constant.customTextfieldCorner)),
          border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(Constant.customTextfieldCorner)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: AppTheme.primaryColor
                      .withOpacity(Constant.customTextFeildColorOpacity)),
              borderRadius:
                  BorderRadius.circular(Constant.customTextfieldCorner))),
    );
  }
}
