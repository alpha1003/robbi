import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:robbi/pages/login_page.dart';
import 'package:robbi/routes.dart';

import 'pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.routeSplash,
      getPages: Routes.pages,
    );
  }
}