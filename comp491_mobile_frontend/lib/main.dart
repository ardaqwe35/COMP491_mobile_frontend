import 'package:comp491_mobile_frontend/constants/routes.dart';
import 'package:comp491_mobile_frontend/screens/create_screen.dart';
import 'package:comp491_mobile_frontend/screens/home_screen.dart';
import 'package:comp491_mobile_frontend/screens/metamask_info_screen.dart';
import 'package:comp491_mobile_frontend/screens/metamask_screen.dart';
import 'package:comp491_mobile_frontend/screens/onboarding_screen.dart';
import 'package:comp491_mobile_frontend/screens/root_screen.dart';
import 'package:comp491_mobile_frontend/screens/settings_screen.dart';
import 'package:comp491_mobile_frontend/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
              child: widget!,
            );
          },
          theme: ThemeData(
            brightness: Brightness.light,
          ),
          darkTheme: ThemeData.dark(),
          //assign initial route based on prev login from hiveservice
          initialRoute: Routes.onboardingScreen,
          debugShowCheckedModeBanner: false,
          defaultTransition: Transition.rightToLeft,
          transitionDuration: const Duration(
            milliseconds: 300,
          ),
          getPages: [
            GetPage(
              name: Routes.createScreen,
              page: () => const CreateScreen(),
            ),
            GetPage(
              name: Routes.homeScreen,
              page: () => const HomeScreen(),
            ),
            GetPage(
              name: Routes.rootScreen,
              page: () => const RootScreen(),
            ),
            GetPage(
              name: Routes.settingsScreen,
              page: () => const SettingsScreen(),
            ),
            GetPage(
              name: Routes.onboardingScreen,
              page: () => const OnboardingScreen(),
            ),
            GetPage(
              name: Routes.connectWalletScreen,
              page: () => const MetamaskScreen(),
            ),
            GetPage(
                name: Routes.signUpScreen, page: () => const SignUpScreen()),
            GetPage(
                name: Routes.metamaskInfoScreen,
                page: () => const MetamaskInfoScreen())
          ],
        ),
      ),
    );
  }
}
