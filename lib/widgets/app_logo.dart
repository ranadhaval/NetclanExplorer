import 'package:flutter/material.dart';
import 'package:netclan_explore/util/_string.dart';
import 'package:netclan_explore/util/constants.dart';
import 'package:netclan_explore/util/resources.dart';
import 'package:netclan_explore/widgets/custom_text.dart';

// ignore: must_be_immutable
class AppLogo extends StatefulWidget {
  double logoHeight;
  double logoWidth;
  AppLogo({super.key, this.logoHeight = 6.5, this.logoWidth = 3});

  @override
  State<AppLogo> createState() => _AppLogoState();
}

class _AppLogoState extends State<AppLogo> {
  double? height;
  double? width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: Constant.appLogoBottomPadding),
          child: Container(
            height: height! / widget.logoHeight,
            width: width! / widget.logoWidth,
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(Constant.appLogoBottomBorderCorner),
                image: const DecorationImage(
                    image: AssetImage(appLogo), fit: BoxFit.cover)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(Constant.appLogoTitlePadding),
          child: CustomText(
            title: Strings.appName,
            height: Constant.appLogoTitleHeight,
            fontWight: FontWeight.bold,
            fontSize: Constant.appLogoTitleSize,
          ),
        ),
      ],
    );
  }
}
