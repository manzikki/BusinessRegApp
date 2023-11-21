import 'package:flutter/material.dart';
import 'package:businessregapp/presentation/login_screen/login_screen.dart';
import 'package:businessregapp/presentation/splash_screen/splash_screen.dart';
import 'package:businessregapp/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:businessregapp/presentation/upload_screen/upload_screen.dart';
import 'package:businessregapp/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String loginScreen = '/login_screen';

  static const String splashScreen = '/splash_screen';

  static const String signUpScreen = '/sign_up_screen';

  static const String uploadScreen = '/upload_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        loginScreen: LoginScreen.builder,
        splashScreen: SplashScreen.builder,
        signUpScreen: SignUpScreen.builder,
        uploadScreen: UploadScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: SplashScreen.builder
      };
}
