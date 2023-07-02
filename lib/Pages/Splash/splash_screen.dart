import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netclan_explore/pages/Splash/splash_controller.dart';
import 'package:netclan_explore/theme/app_theme.dart';
import 'package:netclan_explore/widgets/app_logo.dart';
import 'package:netclan_explore/widgets/no_appbar.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final splashController = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: splashController,
        builder: (_) {
          return Scaffold(
            appBar: NoAppBar(),
            backgroundColor: AppTheme.colorPrimaryTheme,
            body: Center(child: AppLogo()),
          );
        });
  }
}
