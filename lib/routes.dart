

import 'package:get/get.dart';
import 'package:robbi/pages/home_page.dart';
import 'package:robbi/pages/instructions_page.dart';
import 'package:robbi/pages/login_page.dart';
import 'package:robbi/widgets/splash_screen.dart';

class Routes {

  static const String routeHome = '/home';
  static const String routeLogin = '/login';
  static const String routeProfile = '/profile';
  static const String routeSplash = '/splash';
  static const String routeInstruction = '/instruction';

  static final pages = [
    GetPage(name: routeHome, page: () => HomePage()), 
    GetPage(name: routeLogin, page: () => LoginPage()),
    GetPage(name: routeSplash, page: () => SplashScreen()), 
    GetPage(name: routeInstruction, page: () => InstructionsPage())
  ]; 



}