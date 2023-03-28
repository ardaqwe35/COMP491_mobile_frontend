import 'package:comp491_mobile_frontend/constants/app_colors.dart';
import 'package:comp491_mobile_frontend/constants/text_styles.dart';
import 'package:comp491_mobile_frontend/widgets/back_button.dart';
import 'package:comp491_mobile_frontend/widgets/main_button.dart';
import 'package:comp491_mobile_frontend/widgets/tabbar_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQueryData.fromWindow(WidgetsBinding.instance.window),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (_, ch) => GetMaterialApp(
          builder: (context, widget) {
            return MediaQuery(
              ///Setting font does not change with system font size
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: Scaffold(
                body: Container(
                  width: 375.w,
                  height: 812.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BackButtonWidget(),
                      TabbarItemWidget(
                          asset: 'assets/icons/homeDark.png', text: "Home"),
                    ],
                  ),
                  color: Colors.white,
                ),
              ),
            );
          },
          theme: ThemeData(
            appBarTheme: const AppBarTheme(),
            brightness: Brightness.light,
          ),
          darkTheme: ThemeData.dark(),
          debugShowCheckedModeBanner: false,
          defaultTransition: Transition.rightToLeft,
          transitionDuration: const Duration(
            milliseconds: 300,
          ),
          getPages: [
            // GetPage(
            //   name: Routes.splash,
            //   page: () => const SplashScreen(),
            // ),
          ],
        ),
      ),
    );
  }
}