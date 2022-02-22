import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';

import '../pages/login_page.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
        logo: Image.asset('assets/robbi.png'),
        logoSize: 150.0,
        durationInSeconds: 3, 
        loadingText: Text("Cargando..."),
        navigator: LoginPage(),
    );
  }
}