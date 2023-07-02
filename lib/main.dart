import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as se;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:netclan_explore/routes/app_routes.dart';
import 'package:sizer/sizer.dart';
import 'routes/app_pages.dart';
import 'theme/app_theme.dart';
import 'util/_string.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  se.SystemChrome.setPreferredOrientations(
      [se.DeviceOrientation.portraitDown, se.DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, dtype) {
      return GetMaterialApp(
        theme: ThemeData(
          primaryColor: AppTheme.primaryColor,
          fontFamily: AppTheme.appFontName,
          textTheme: AppTheme.textTheme,
          appBarTheme: const AppBarTheme(
            systemOverlayStyle:
                se.SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
          ),
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: AppTheme.colorPrimaryTheme,
            selectionColor: AppTheme.colorPrimaryTheme,
            selectionHandleColor: AppTheme.colorPrimaryTheme,
          ),
        ),
        defaultTransition: Transition.size,
        title: Strings.appName,
        initialRoute: AppRoute.SPLASH,
        getPages: AppPages.list,
        debugShowCheckedModeBanner: false,
      );
    });
  }
}
